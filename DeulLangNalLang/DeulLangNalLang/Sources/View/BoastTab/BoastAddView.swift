import SwiftUI
import UIKit

struct BoastAddView: View {
    @State private var text = ""
        @State private var isShowingImagePicker = false
        @State private var selectedImages: [UIImage?] = [nil, nil]
        @Environment(\.presentationMode) var presentationMode

    var body: some View {
            NavigationView {
                VStack {
                    CustomTextView(text: $text, isShowingImagePicker: $isShowingImagePicker)
                        .frame(height: 200)
                        .padding()
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        ForEach(0..<selectedImages.count, id: \.self) { index in
                            if let image = selectedImages[index] {
                                VStack {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .padding()
                                    
                                    Button(action: {
                                        selectedImages[index] = nil
                                    }) {
                                        Text("삭제")
                                            .foregroundColor(.red)
                                    }
                                }
                            } else {
                                Button(action: {
                                    isShowingImagePicker = true
                                }) {
                                    Image(systemName: "add")
                                        .font(.title)
                                }
                                .sheet(isPresented: $isShowingImagePicker) {
                                    ImagePicker(selectedImage: $selectedImages[index])
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .navigationBarTitle("자랑쓰기")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("완료") {
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }

struct CustomTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var isShowingImagePicker: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.systemFont(ofSize: 16)
        
        // 툴바 설정
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: context.coordinator, action: #selector(context.coordinator.cameraButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexibleSpace, cameraButton]
        textView.inputAccessoryView = toolbar
        
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextView

        init(_ parent: CustomTextView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        @objc func cameraButtonTapped() {
            parent.isShowingImagePicker = true
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedImage: UIImage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BoastAddView()
    }
}

import SwiftUI
import UIKit
import SwiftData

struct BoastAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    @Environment(User.self) var user: User
    
    @State private var text = ""
    @State private var isShowingImagePicker = false
    @State private var selectedImageDatas: [Data] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                CustomTextView(text: $text, isShowingImagePicker: $isShowingImagePicker, placeholder: "내용을 입력하세요")
                    .frame(height: 200)
                    .padding()
                HStack {
                    Spacer()
                    Text("\(text.count)/100")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 5)
                }
                HStack(spacing: 8) {
                    ForEach(0..<selectedImageDatas.count, id: \.self) { index in
                        let data = selectedImageDatas[index]
                        if let image = UIImage(data: data) {
                            ZStack {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 177, height: 116)
                                    .clipped()
                                    .cornerRadius(16)
                                
                                VStack(spacing: 0) {
                                    HStack(spacing: 0) {
                                        Spacer()
                                        Button(action: {
                                            selectedImageDatas.remove(at: index)
                                        }) {
                                            Image(systemName: "x.circle")
                                                .foregroundColor(.red)
                                                .padding(.top, 5)
                                                .padding(.trailing, 6)
                                        }
                                    }
                                    Spacer()
                                }
                            }
                            .frame(width: 177, height: 116)
                        } else {
                            Button(action: {
                                isShowingImagePicker = true
                            }) {
                                Image(systemName: "add")
                                    .font(.title)
                            }
                            .sheet(isPresented: $isShowingImagePicker) {
                                ImagePicker(selectedImageData: $selectedImageDatas[index])
                            }
                        }
                        
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("자랑쓰기")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("완료") {
                if text != "" {
                    let newBoast = Boast(contents: text, 
                                         date: Date(),
                                         writer: user.name)
                    modelContext.insert(newBoast)
                }
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct CustomTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var isShowingImagePicker: Bool
    var placeholder: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.systemFont(ofSize: 16)
        
        // Placeholder 설정
        textView.text = placeholder
        textView.textColor = .lightGray
        
        // 툴바 설정
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: context.coordinator, action: #selector(context.coordinator.cameraButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [cameraButton, flexibleSpace]
        textView.inputAccessoryView = toolbar
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        if text.isEmpty {
            uiView.text = placeholder
            uiView.textColor = .lightGray
        } else {
            uiView.text = text
            uiView.textColor = .black
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextView
        
        init(_ parent: CustomTextView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .lightGray {
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = parent.placeholder
                textView.textColor = .lightGray
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            let currentText = textView.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
            return updatedText.count <= 100
        }
        
        @objc func cameraButtonTapped() {
            parent.isShowingImagePicker = true
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedImageData: Data
    
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
                guard let data = image.pngData() else { return }
                parent.selectedImageData = data
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

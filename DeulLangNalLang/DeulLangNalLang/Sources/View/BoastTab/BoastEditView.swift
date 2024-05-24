import SwiftUI
import UIKit
import SwiftData

struct BoastEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    @Environment(User.self) var user: User
    
    @Binding var boastId: UUID
    
    @Query var boasts: [Boast]
    
    @State private var selectedText = ""
    @State private var isShowingImagePicker = false
    @State private var isShowingCamera = false
    
    @State private var selectedImageDatas: [Data] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                EditCustomTextView(text: $selectedText, isShowingImagePicker: $isShowingImagePicker, isShowingCamera: $isShowingCamera)
                    .padding()
                HStack {
                    Spacer()
                    Text("\(selectedText.count)/100")
                        .font(.footnoteRegular)
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
                                            isShowingImagePicker = false
                                            isShowingCamera = false
                                            selectedImageDatas.remove(at: index)
                                        }) {
                                            Image(systemName: "x.circle.fill")
                                                .font(.title1Regular)
                                                .foregroundColor(.gray)
                                                .padding(.top, 4)
                                                .padding(.trailing, 4)
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
                                    .font(.title1Regular)
                            }
                            .fullScreenCover(isPresented: $isShowingImagePicker) {
                                ImagePicker(isShowingCamera: $isShowingCamera, selectedImageData: $selectedImageDatas[index])
                                .ignoresSafeArea()
                            }
                        }
                        
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("자랑쓰기")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("완료") {
                //MARK: 완료버튼 눌렀을 때 새로운 내용을 swiftData에 넣어줌
                if let index = boasts.firstIndex(where: { $0.id == boastId }) {
                    
                    let boast = boasts[index]
                    
                    boast.contents = selectedText
                    boast.imageDatas = selectedImageDatas
                }
                presentationMode.wrappedValue.dismiss()
            })
            
        }
        .onAppear {
            loadBoast()
            print(selectedText)
        }
    }
    //MARK: load할 때 기존 내용 넣어주기
    private func loadBoast() {
        if let index = boasts.firstIndex(where: { $0.id == boastId }) {
            selectedText = boasts[index].contents
            selectedImageDatas = boasts[index].imageDatas
        }
    }
}

struct EditCustomTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var isShowingImagePicker: Bool
    @Binding var isShowingCamera: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = .bodyRegular(ofSize: 16.5)

        // 초기 text 설정
        textView.text = text
        textView.textColor = .black
        
        //MARK: 툴바 설정
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: context.coordinator,
                                           action: #selector(context.coordinator.cameraButtonTapped)
        )
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let galleryButton = UIBarButtonItem(
            image: UIImage(systemName: "photo"),
            style: .plain,
            target: context.coordinator,
            action: #selector(context.coordinator.galleryButtonTapped)
        )
        
        toolbar.items = [cameraButton, galleryButton, flexibleSpace]
        textView.inputAccessoryView = toolbar
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: EditCustomTextView
        
        init(_ parent: EditCustomTextView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .lightGray {
                textView.text = nil
                textView.textColor = .black
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "내용을 입력하세요" // 플레이스홀더
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
            parent.isShowingCamera = true
        }
        
        // 갤러리 버튼 tap 했을 때
        @objc func galleryButtonTapped() {
            parent.isShowingImagePicker = true
            parent.isShowingCamera = false
        }
    }
}

struct EditImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var isShowingCamera: Bool
    @Binding var selectedImageData: Data
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        // camera / gallery 설정
        if isShowingCamera {
            picker.sourceType = .camera
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: EditImagePicker
        
        init(_ parent: EditImagePicker) {
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

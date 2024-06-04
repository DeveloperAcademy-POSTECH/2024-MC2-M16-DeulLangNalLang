//
//  CameraView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/25/24.
//

import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImageData: Data?
    @Environment(\.presentationMode) var isPresented
    var mode: UIImagePickerController.SourceType
    
    var onDismiss: () -> Void
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = mode
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self, onDismiss: self.onDismiss)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: CameraView
    var onDismiss: () -> Void
    
    init(picker: CameraView, onDismiss: @escaping () -> Void) {
        self.picker = picker
        self.onDismiss = onDismiss
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        guard let data = selectedImage.jpegData(compressionQuality: 0.6) else { return }
        self.picker.selectedImageData = data
        onDismiss()
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

//
//  PermissionManager.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/24/24.
//

import AVFoundation

/// 카메라 권한 설정
@Observable
class PermissionManager {
    var permissionGranted = false
    
    func requestCameraPermission() {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if granted {
                print("Camera 권한 허용")
            } else {
                print("Camera 권한 거부")
            }
        })
    }
}

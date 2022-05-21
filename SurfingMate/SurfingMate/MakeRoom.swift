//
//  MakeRoom.swift
//  SurfingMate
//
//  Created by 양채연 on 2022/05/21.
//

// 방제목, 내용, 목적지->picker, 날짜->picker, 시간, 총인원 -> customTextField
// 제주, 양양, 속초, 고성

import UIKit
import Foundation
import Then
import SnapKit

clsss MakeRoomController: UIViewController{
    override fun viewDidLoad() {
        
    }
}


import SwiftUI
// canvas 세팅

struct ProfileViewControllerRepresentable: UIViewControllerRepresentable{
    typealias UIViewControllerType = ProfileViewController
    
    func makeUIViewController(context: Context) -> ProfileViewController {
        return ProfileViewController()
    }
    func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {
        
    }
}

@available(iOS 13.0.0, *)
struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        ProfileViewControllerRepresentable()
    }
}

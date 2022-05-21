//
//  ProfileViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit
import Then
import SnapKit

class ProfileViewController: UIViewController {
    
    let textLabel = UILabel().then {
        $0.text = "프로필"
        $0.font = .systemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let userImg = UIImageView().then{
        $0.image=UIImage(named: "profile")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let logOutBt = UIButton(type: .custom).then {
            $0.setTitle("로그아웃하기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 128, bottom: 14, right: 127)
            $0.isEnabled = false
        }

    let nickName = UILabel().then{
        $0.text="닉네임"
        $0.font = .systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let userInfo = UILabel().then{
        $0.text="주로 양양에서 서핑을 타는 서핑초보입니다!"
        $0.font = .systemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func uiLayout(){
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
            
        }
        view.addSubview(userImg)
        userImg.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-180)
        }

        view.addSubview(nickName)
        nickName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userImg.snp.bottom).offset(35)
        }
        view.addSubview(userInfo)
        userInfo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nickName.snp.bottom).offset(35)
        }
        view.addSubview(logOutBt)
        logOutBt.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userInfo.snp.bottom).offset(100)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        uiLayout()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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




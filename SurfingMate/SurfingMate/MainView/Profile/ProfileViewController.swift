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
    
    let profile = UILabel().then {
        $0.text = "프로필"
        $0.font = .systemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let userImg = UIImageView().then{
        $0.image=UIImage(named: "profile")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let viewResgiBt = UIButton(type: .custom).then {
            $0.setTitle("내가 등록한 방", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
            $0.isEnabled = false
        }
    let viewAttenBt = UIButton(type: .custom).then {
            $0.setTitle("내가 참가한 방", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
            $0.isEnabled = false
        }
    let logOutBt = UIButton(type: .custom).then {
            $0.setTitle("로그아웃", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
            $0.isEnabled = false
        }


    let nickName = UILabel().then{
        $0.text="닉네임"
        $0.font = .systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    
    func uiLayout(){
        view.addSubview(profile)
        profile.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
            
        }
        view.addSubview(userImg)
        userImg.snp.makeConstraints {
            $0.width.height.equalTo(80)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-170)
        }

        view.addSubview(nickName)
        nickName.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userImg.snp.bottom).offset(30)
        }

        view.addSubview(viewResgiBt)
        viewResgiBt.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nickName.snp.bottom).offset(80)
        }
        view.addSubview(viewAttenBt)
        viewAttenBt.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(viewResgiBt.snp.bottom).offset(40)
        }
        view.addSubview(logOutBt)
        logOutBt.snp.makeConstraints{
            $0.width.equalTo(300)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(viewAttenBt.snp.bottom).offset(40)
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




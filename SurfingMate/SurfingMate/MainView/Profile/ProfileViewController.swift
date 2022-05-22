//
//  ProfileViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit
import Then
import SnapKit
import RxCocoa
import RxSwift

class ProfileViewController: UIViewController {
    
    let profile = UILabel().then {
        $0.text = "프로필"
        $0.font = .systemFont(ofSize: 25)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let userImg = UIImageView().then{
        $0.image=UIImage(named: "logo")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let viewResgiBt = UIButton(type: .custom).then {
            $0.setTitle("내가 등록한 방", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
        }
    let viewAttenBt = UIButton(type: .custom).then {
            $0.setTitle("내가 참가한 방", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
        
        }
    let logOutBt = UIButton(type: .custom).then {
            $0.setTitle("로그아웃", for: .normal)
            $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
            $0.titleLabel?.textColor = .white
            $0.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
            $0.layer.cornerRadius = 27.0
            $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 100, bottom: 14, right: 100)
           
        }


    let nickName = UILabel().then{
        $0.text = User.instance.nickName
        $0.font = .systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let disposeBag = DisposeBag()
    
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
    
    func bind() {
        viewResgiBt.rx.tap.subscribe(onNext: {
            let vc = MyBungCollectionView("http://www.debinserver.shop:8080/api/v1/carpool/my-room")
            self.present(vc, animated: true)
        }).disposed(by: disposeBag)
        
        viewAttenBt.rx.tap.subscribe(onNext: {
            let vc = MyBungCollectionView("http://www.debinserver.shop:8080/api/v1/carpool/my-enter-room")
            self.present(vc, animated: true)
        }).disposed(by: disposeBag)
        
        
        logOutBt.rx.tap.subscribe(onNext: {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
            
        }).disposed(by: disposeBag)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bind()
        uiLayout()
    }
    
    
}



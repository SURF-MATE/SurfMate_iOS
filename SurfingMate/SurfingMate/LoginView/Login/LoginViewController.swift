//
//  LoginViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    let vm = LoginViewModel()
    
    //Layout View
    let loginLayout = UIView()
    let signUpLayout = UIView()
    
    //Logo View
    let logoImageView = UIImageView(image: UIImage(named: "logo"))
    let logoTextView = UIImageView(image: UIImage(named: "logoText"))
    
    
    let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let emailTextField = CustomTextField(image: UIImage(named: "tfEmail")!, text: "이메일 주소 입력").then {
        $0.backgroundColor = UIColor.rgb(red: 243, green: 243, blue: 243)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    }
    
    let emailAlert = UILabel().then {
        $0.text = ""
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
        $0.textColor = UIColor.rgb(red: 255, green: 108, blue: 0)
    }
    
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let pwTextField = CustomTextField(image: UIImage(named: "tfPassword")!, text: "비밀번호 입력").then {
        $0.backgroundColor = UIColor.rgb(red: 243, green: 243, blue: 243)
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.isSecureTextEntry = true
    }
    
    let pwAlert = UILabel().then {
        $0.text = ""
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
        $0.textColor = UIColor.rgb(red: 255, green: 108, blue: 0)
    }
    
    let logInBt = UIButton(type: .custom).then {
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = UIColor.rgb(red: 177, green: 177, blue: 177)
        $0.layer.cornerRadius = 27.0
        $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 128, bottom: 14, right: 127)
        $0.isEnabled = false
    }
    
    //    let findEmailBt = UIButton(type: .custom).then {
    //        $0.setTitle("이메일 찾기", for: .normal)
    //        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    //        $0.setTitleColor(UIColor.rgb(red: 147, green: 147, blue: 147), for: .normal)
    //        $0.titleEdgeInsets.top = 9
    //        $0.titleEdgeInsets.bottom = 10
    //        $0.titleEdgeInsets.left = 16
    //        $0.titleEdgeInsets.right = 20
    //    }
    //
    //    let findPwBt = UIButton(type: .custom).then {
    //        $0.setTitle("비밀번호 재설정", for: .normal)
    //        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    //        $0.setTitleColor(UIColor.rgb(red: 147, green: 147, blue: 147), for: .normal)
    //        $0.titleEdgeInsets.top = 9
    //        $0.titleEdgeInsets.bottom = 8
    //        $0.titleEdgeInsets.left = 20
    //        $0.titleEdgeInsets.right = 5
    //    }
    //
    //    let separator = UIView().then {
    //        $0.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
    //    }
    
    let separator2 = UIView().then {
        $0.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
    }
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "아직 회원이 아니신가요? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        attributedTitle.append(NSAttributedString(string: "회원가입", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 59, green: 133, blue: 209)]))
        
        button.setTitle("Don't have an account? Sign Up.", for: .normal)
        return button
    }()
    
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension LoginViewController {
    
    fileprivate func setUI() {
        view.backgroundColor = .white
        setLayout()
        
        loginLayout.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.width.height.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        
        loginLayout.addSubview(logoTextView)
        logoTextView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
        loginLayout.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(logoTextView.snp.bottom).offset(70)
            $0.leading.equalToSuperview().offset(25)
        }
        
        loginLayout.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        loginLayout.addSubview(emailAlert)
        emailAlert.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(25)
        }
        
        loginLayout.addSubview(pwLabel)
        pwLabel.snp.makeConstraints {
            $0.top.equalTo(emailAlert.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(25)
        }
        
        loginLayout.addSubview(pwTextField)
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(pwLabel.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        loginLayout.addSubview(pwAlert)
        pwAlert.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(25)
        }
        
        loginLayout.addSubview(logInBt)
        logInBt.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        //        let findStack = UIStackView(arrangedSubviews: [findEmailBt, findPwBt]).then {
        //            $0.axis = .horizontal
        //            $0.distribution = .fillEqually
        //            $0.spacing = 0
        //        }
        //
        //        loginLayout.addSubview(findStack)
        //        findStack.snp.makeConstraints {
        //            $0.top.equalTo(logInBt.snp.bottom).offset(11)
        //            $0.leading.equalToSuperview().offset(56)
        //            $0.trailing.equalToSuperview().offset(-57)
        //        }
        //
        //        loginLayout.addSubview(separator)
        //        separator.snp.makeConstraints {
        //            $0.top.equalTo(logInBt.snp.bottom).offset(17)
        //            $0.centerX.equalToSuperview()
        //            $0.height.equalTo(findStack.snp.height).multipliedBy(0.6)
        //            $0.width.equalTo(2)
        //        }
        
        signUpLayout.addSubview(signUpButton)
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-10)
            $0.centerX.equalToSuperview()
        }
        
        signUpLayout.addSubview(separator2)
        separator2.snp.makeConstraints {
            $0.bottom.equalTo(signUpButton.snp.top).offset(-15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
    
    fileprivate func setLayout() {
        safeView.addSubview(loginLayout)
        loginLayout.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.8)
        }
        
        safeView.addSubview(signUpLayout)
        signUpLayout.snp.makeConstraints {
            $0.top.equalTo(loginLayout.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    fileprivate func bind() {
        bindInput()
        bindOutput()
    }
    
    fileprivate func bindInput() {
        
    }
    
    fileprivate func bindOutput() {
        signUpButton.rx.tap.subscribe(onNext: {
            self.goToSignUp()
        }).disposed(by: disposeBag)
    }
    
    func goToSignUp() {
        let viewController = SignUpViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
}

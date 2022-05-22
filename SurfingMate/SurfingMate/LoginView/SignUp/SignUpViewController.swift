//
//  SignUpViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    
    let vm = SignUpViewModel()
    let disposeBag = DisposeBag()
    
    let backBt = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "backArrow"), for: .normal)
    }
    
    let nameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let nameTextField = CustomTextField(image: UIImage(named: "tfPerson")!, text: "닉네임 입력").then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    }
    
    let nameAlertLabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor.rgb(red: 255, green: 108, blue: 0)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 11)
    }
    
    let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let emailTextField = CustomTextField(image: UIImage(named: "tfEmail")!, text: "이메일 주소 입력").then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    }
    
    let emailAlertLabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor.rgb(red: 255, green: 108, blue: 0)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 11)
    }
    
    let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let pwTextField = CustomTextField(image: UIImage(named: "tfPassword")!, text: "영문자와 숫자 포함 8자 이상 입력").then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.isSecureTextEntry = true
    }
    
    let pwAlertLabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor.rgb(red: 255, green: 108, blue: 0)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 11)
    }
    
    let pwConfirmLabel = UILabel().then {
        $0.text = "비밀번호 확인"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let pwConfirmTextField = CustomTextField(image: UIImage(named: "tfPassword")!, text: "다시 한번 입력").then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.isSecureTextEntry = true
    }
    
    let pwConfirmAlertLabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor.rgb(red: 255, green: 108, blue: 0)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 11)
    }
    
    let genderLabel = UILabel().then {
        $0.text = "성별"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let maleBt = UIButton(type: .custom).then {
        $0.backgroundColor = UIColor.rgb(red: 243, green: 243, blue: 243)
        $0.setTitle("남성", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.setTitleColor(UIColor.rgb(red: 55, green: 57, blue: 61), for: .normal)
        $0.layer.cornerRadius = 20.0
        $0.contentEdgeInsets = UIEdgeInsets(top: 16, left: 61, bottom: 15, right: 61)
    }
    
    let femaleBt = UIButton(type: .custom).then {
        $0.setTitle("여성", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.setTitleColor(UIColor.rgb(red: 55, green: 57, blue: 61), for: .normal)
        $0.backgroundColor = UIColor.rgb(red: 243, green: 243, blue: 243)
        $0.layer.cornerRadius = 20.0
        $0.contentEdgeInsets = UIEdgeInsets(top: 16, left: 61, bottom: 15, right: 61)
    }
    
    let birthLabel = UILabel().then {
        $0.text = "생년월일"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.textColor = UIColor.rgb(red: 100, green: 98, blue: 94)
    }
    
    let birthTextField = CustomTextField(image: UIImage(named: "tfBirth")!, text: "2000 / 06 / 15").then {
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        $0.setDatePicker(target: self)
    }
    
    let signInBt = UIButton(type: .custom).then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = UIColor.rgb(red: 195, green: 195, blue: 195)
        $0.layer.cornerRadius = 27.0
        $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 134, bottom: 13, right: 131)
        $0.isEnabled = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bind()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

extension SignUpViewController {
    
    private func setUI() {
        view.backgroundColor = .white
        
        safeView.addSubview(backBt)
        backBt.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.equalToSuperview().offset(20)
        }
        
        safeView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(backBt.snp.bottom).offset(33)
            $0.leading.equalToSuperview().offset(25)
        }
        
        safeView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeView.snp.leading).offset(26)
            $0.trailing.equalTo(self.safeView.snp.trailing).offset(-25)
        }
        
        safeView.addSubview(nameAlertLabel)
        nameAlertLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(5)
            $0.leading.equalTo(self.safeView.snp.leading).offset(25)
        }
        
        safeView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(25)
        }
        safeView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeView.snp.leading).offset(26)
            $0.trailing.equalTo(self.safeView.snp.trailing).offset(-25)
        }
        safeView.addSubview(emailAlertLabel)
        emailAlertLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(5)
            $0.leading.equalTo(self.safeView.snp.leading).offset(25)
        }
        
        safeView.addSubview(pwLabel)
        pwLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(25)
        }
        safeView.addSubview(pwTextField)
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(pwLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeView.snp.leading).offset(26)
            $0.trailing.equalTo(self.safeView.snp.trailing).offset(-25)
        }
        safeView.addSubview(pwAlertLabel)
        pwAlertLabel.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(5)
            $0.leading.equalTo(self.safeView.snp.leading).offset(25)
        }
        
        safeView.addSubview(pwConfirmLabel)
        pwConfirmLabel.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(25)
        }
        
        safeView.addSubview(pwConfirmTextField)
        pwConfirmTextField.snp.makeConstraints {
            $0.top.equalTo(pwConfirmLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.safeView.snp.leading).offset(26)
            $0.trailing.equalTo(self.safeView.snp.trailing).offset(-25)
        }
        
        safeView.addSubview(pwConfirmAlertLabel)
        pwConfirmAlertLabel.snp.makeConstraints {
            $0.top.equalTo(pwConfirmTextField.snp.bottom).offset(5)
            $0.leading.equalTo(self.safeView.snp.leading).offset(25)
        }
        
        safeView.addSubview(genderLabel)
        genderLabel.snp.makeConstraints {
            $0.top.equalTo(pwConfirmTextField.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(25)
        }
        
        let genderStackView = UIStackView(arrangedSubviews: [maleBt, femaleBt]).then {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 28
        }
        
        safeView.addSubview(genderStackView)
        genderStackView.snp.makeConstraints {
            $0.top.equalTo(genderLabel.snp.bottom).offset(8)
            $0.leading.equalTo(safeView.snp.leading).offset(26)
            $0.trailing.equalTo(safeView.snp.trailing).offset(-25)
            
        }
        
        safeView.addSubview(birthLabel)
        birthLabel.snp.makeConstraints {
            $0.top.equalTo(genderStackView.snp.bottom).offset(28)
            $0.leading.equalTo(safeView.snp.leading).offset(25)
        }
        
        safeView.addSubview(birthTextField)
        birthTextField.snp.makeConstraints {
            $0.top.equalTo(birthLabel.snp.bottom).offset(8)
            $0.leading.equalTo(safeView.snp.leading).offset(26)
            $0.trailing.equalTo(safeView.snp.trailing).offset(-25)
        }
        
        safeView.addSubview(signInBt)
        signInBt.snp.makeConstraints {
            $0.top.equalTo(birthTextField.snp.bottom).offset(30)
            $0.leading.equalTo(safeView.snp.leading).offset(26)
            $0.trailing.equalTo(safeView.snp.trailing).offset(-25)
        }
        
    }
    
    fileprivate func bind() {
        bindInput()
        bindOutput()
    }
    
    fileprivate func bindInput() {
        
        backBt.rx.tap.subscribe(onNext: {
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        nameTextField.rx.controlEvent([.editingDidEnd])
            .map { self.nameTextField.text ?? "" }
            .bind(to: vm.input.nameObserver)
            .disposed(by: disposeBag)
        
        emailTextField.rx.controlEvent([.editingDidEnd])
            .map { self.emailTextField.text ?? "" }
            .bind(to: vm.input.emailObserver)
            .disposed(by: disposeBag)
        
        pwTextField.rx.controlEvent([.editingDidEnd])
            .map { self.pwTextField.text ?? "" }
            .bind(to: vm.input.pwObserver)
            .disposed(by: disposeBag)
        
        pwConfirmTextField.rx.controlEvent([.editingDidEnd])
            .map { self.pwConfirmTextField.text ?? "" }
            .bind(to: vm.input.pwConfirmObserver)
            .disposed(by: disposeBag)
        
        maleBt.rx.tap
            .map { Gender.male }
            .bind(to: vm.input.genderObserver)
            .disposed(by: disposeBag)
        
        femaleBt.rx.tap
            .map { Gender.female }
            .bind(to: vm.input.genderObserver)
            .disposed(by: disposeBag)
        
        birthTextField.rx.controlEvent([.editingDidEnd])
            .map { self.birthTextField.text ?? "" }
            .bind(to: vm.input.birthObserver)
            .disposed(by: disposeBag)
        
        signInBt.rx.tap
            .bind(to: vm.input.signUpObserver)
            .disposed(by: disposeBag)
        
    }
    
    fileprivate func bindOutput() {
        
        vm.output.emailValid.drive(onNext: {valid in
            if !valid {
                self.emailAlertLabel.text = "이메일 형식이 올바르지 않습니다."
                self.emailTextField.setErrorRight()
            } else {
                self.emailAlertLabel.text = ""
                self.emailTextField.setRight()
            }
        }).disposed(by: disposeBag)
        
        vm.output.pwValid.drive(onNext: { valid in
            
            if valid {
                self.pwAlertLabel.text = ""
                self.pwTextField.setRight()
            } else {
                self.pwAlertLabel.text = "영문자와 숫자 포함 8자 이상 입력해주세요."
                self.pwTextField.setErrorRight()
            }
            
        }).disposed(by: disposeBag)
        
        vm.output.pwConfirmValid.drive(onNext: { valid in
            if valid {
                self.pwConfirmAlertLabel.text = ""
                self.pwConfirmTextField.setRight()
            } else {
                self.pwConfirmAlertLabel.text = "비밀번호가 맞지 않습니다."
                self.pwConfirmTextField.setErrorRight()
            }
        }).disposed(by: disposeBag)
        
        vm.output.genderValid.drive(onNext: { valid in
            switch valid {
            case .male:
                self.maleBt.setTitleColor(.white, for: .normal)
                self.maleBt.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
                self.femaleBt.setTitleColor(UIColor.rgb(red: 55, green: 57, blue: 61), for: .normal)
                self.femaleBt.backgroundColor = .white
            case .female:
                self.femaleBt.setTitleColor(.white, for: .normal)
                self.femaleBt.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
                self.maleBt.setTitleColor(UIColor.rgb(red: 55, green: 57, blue: 61), for: .normal)
                self.maleBt.backgroundColor = .white
            case .none:
                break
            }
        }).disposed(by: disposeBag)
        
        vm.output.buttonValid.drive(onNext: { valid in
            if valid {
                self.signInBt.isEnabled = true
                self.signInBt.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
            } else {
                self.signInBt.isEnabled = false
                self.signInBt.backgroundColor = UIColor.rgb(red: 195, green: 195, blue: 195)
            }
        }).disposed(by: disposeBag)
        
        vm.output.goSignUp.asSignal().emit(onNext: { value in
            User.instance = value
            let viewController = MainTabViewController()
            let navController = UINavigationController(rootViewController: viewController)
            navController.isNavigationBarHidden = true
            navController.modalTransitionStyle = .crossDissolve
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true)
        }).disposed(by: disposeBag)
        
        vm.output.errorValue.asSignal()
            .emit(onNext: { error in
                let ac = UIAlertController(title: "에러", message: error.localizedDescription, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                self.present(ac, animated: true)
            }).disposed(by: disposeBag)
        
    }
}



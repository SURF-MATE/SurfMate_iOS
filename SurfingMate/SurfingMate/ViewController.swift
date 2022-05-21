//
//  ViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    let logoImageView = UIImageView(image: UIImage(named: "logo"))
    let logoTextView = UIImageView(image: UIImage(named: "logoText"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.goToMainView()
        }
    }
    
    fileprivate func setUI() {
        view.backgroundColor = .white
        safeView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(200)
            $0.width.height.equalTo(200)
        }
        
        safeView.addSubview(logoTextView)
        logoTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalTo(50)
        }
    }
    
    
    private func goToMainView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let viewController = MakeRoomViewController()
            let navController = UINavigationController(rootViewController: viewController)
            navController.isNavigationBarHidden = true
            navController.modalTransitionStyle = .crossDissolve
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true)
        }
    }
    
    private func goToLoginView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let vc = LoginViewController()
            let navController = UINavigationController(rootViewController: vc)
            navController.isNavigationBarHidden = true
            navController.modalTransitionStyle = .crossDissolve
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true, completion: nil)
        }
    }
    
}


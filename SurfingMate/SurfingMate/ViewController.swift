//
//  ViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.goToMainView()
        }
    }
    
    private func goToMainView() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let viewController = MainTabViewController()
                let navController = UINavigationController(rootViewController: viewController)
                navController.isNavigationBarHidden = true
                navController.modalTransitionStyle = .crossDissolve
                navController.modalPresentationStyle = .fullScreen
                self.present(navController, animated: true)
                
            }
        }

}


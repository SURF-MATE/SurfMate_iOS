//
//  MainTabViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func setupViewControllers() {
        let homeViewController = templateNavController(unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootViewController: HomeViewController())
            let carPoolViewController = templateNavController(unselectedImage: UIImage(systemName: "car")!, selectedImage: UIImage(systemName: "car.fill")!, rootViewController: CarPoolViewController())
            let profileViewController = templateNavController(unselectedImage: UIImage(systemName: "person.crop.circle")!, selectedImage: UIImage(systemName: "person.crop.circle.fill")!, rootViewController: ProfileViewController())
            tabBar.tintColor = .black
            viewControllers = [homeViewController, carPoolViewController, profileViewController]
            
            guard let items = tabBar.items else { return }
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
            }
            
            
        }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        return navController
    }
    
}

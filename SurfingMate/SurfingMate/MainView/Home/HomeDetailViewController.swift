//
//  HomeDetailViewController.swift
//  SurfingMate
//
//  Created by 이동희 on 2022/05/21.
//

import Foundation
import UIKit

class HomeDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private var currentStatusView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
}

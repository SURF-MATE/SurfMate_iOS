//
//  CarPoolViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit
import Foundation
import Then
import RxCocoa
import RxSwift

class CarPoolViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let searchBar = CustomTextField(image: UIImage(named: "tfSearch")!, text: "검색")
    
    let countLb = UILabel().then {
        $0.text = "총 68건"
        $0.textColor = UIColor.rgb(red: 171, green: 171, blue: 171)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    
    let bookmarkCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.alpha = 0
        return collectionView
    }()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCV()
    }
    
    
}

extension CarPoolViewController {
    
    fileprivate func setUI() {
        view.backgroundColor = .white
        safeView.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
        }
        
        safeView.addSubview(countLb)
        countLb.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
        }
        
        //refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        bookmarkCV.refreshControl = refreshControl
        safeView.addSubview(bookmarkCV)
        bookmarkCV.snp.makeConstraints {
            $0.top.equalTo(countLb.snp.bottom).offset(17)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        bookmarkCV.reloadData()
        
    }
    
    fileprivate func setCV() {
        bookmarkCV.dataSource = nil
        bookmarkCV.delegate = nil
        bookmarkCV.register(CarPoolCell.self, forCellWithReuseIdentifier: "cell")
        bookmarkCV.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension CarPoolViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 40
        return CGSize(width: width, height: 133)
    }
    
    
}

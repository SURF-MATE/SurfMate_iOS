//
//  HomeViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    let imgNum = ["1", "2", "3", "4"]
    let weather = ["1-1", "2-1", "3-1", "4-1"]
    
    let beachName = ["고성 천지해변", "제주 중문해변", "속초 해변", "양양 문채해변"]
    let hotPlace = ["봉포 머구리집", "브라더 후드", "딥서프", "누나 서프"]
    let digit = ["0.15m / 1.0s", "0.17m / 4.0s", "0.18m / 3.0s", "0.19m / 1.0s"]
    let comment = ["패들을 연습하세요.", "파도가 매섭게 몰려와요", "용감하게 파도에 맞서요", "해파리를 조심하세요."]
    
    let homeCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.alpha = 1
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        safeView.addSubview(homeCV)
        homeCV.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.bottom.equalToSuperview()
            
        }
        setCV()
    }
    
    func setCV() {
        homeCV.dataSource = self
        homeCV.delegate = self
        homeCV.register(HomeViewCellCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        homeCV.reloadData()
    }

    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeViewCellCollectionViewCell
        
        let index = indexPath.row
        
        cell.imageView.image = UIImage(named: imgNum[index])
        cell.weatherImage.image = UIImage(named: weather[index])
        cell.titleLb.text = beachName[index]
        cell.comentLb.text = comment[index]
        cell.locationLb.text = hotPlace[index]
        cell.waveLb.text = digit[index]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailHomeViewController()
        self.present(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 17
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2 - 40
        return CGSize(width: width, height: 300)
    }
    
    
}

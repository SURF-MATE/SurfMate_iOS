//
//  HomeViewCellCollectionViewCell.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/22.
//

import UIKit
import RxSwift

class HomeViewCellCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: UIImage(named: "1")).then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        
    }
    
    var titleLb = UILabel().then {
        $0.text = "고성 천진해변"
        $0.textColor = UIColor.rgb(red: 38, green: 38, blue: 38)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    }
    
    let waveImageVIew = UIImageView(image: UIImage(named: "wave"))
    
    let waveLb = UILabel().then {
        $0.text = "0.13m / 0.0s"
        $0.textColor = UIColor.rgb(red: 148, green: 148, blue: 148)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
    }
    
    let locationImageView = UIImageView(image: UIImage(systemName: "location.circle")).then {
        $0.tintColor = .black
    }
    
    let locationLb = UILabel().then {
        $0.text = "봉포 머구리집"
        $0.textColor = UIColor.rgb(red: 148, green: 148, blue: 148)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 12)
    }
    
    let separator = UIView().then {
        $0.backgroundColor = UIColor.rgb(red: 224, green: 224, blue: 224)
    }
    
    let weatherImage = UIImageView(image: UIImage(named: "1-1"))
    
    var comentLb = UILabel().then {
        $0.text = "패들 연습하세요."
        $0.textColor = UIColor.rgb(red: 38, green: 38, blue: 38)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(80)
        }
        
        addSubview(titleLb)
        titleLb.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        addSubview(waveImageVIew)
        waveImageVIew.snp.makeConstraints {
            $0.top.equalTo(titleLb.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(12)
        }
        
        addSubview(waveLb)
        waveLb.snp.makeConstraints {
            $0.top.equalTo(titleLb.snp.bottom).offset(10)
            $0.leading.equalTo(waveImageVIew.snp.trailing).offset(8)
            
        }
        
        addSubview(locationImageView)
        locationImageView.snp.makeConstraints {
            $0.top.equalTo(waveLb.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(8)
            $0.width.height.equalTo(12)
        }
        
        addSubview(locationLb)
        locationLb.snp.makeConstraints {
            $0.top.equalTo(waveLb.snp.bottom).offset(10)
            $0.leading.equalTo(locationImageView.snp.trailing).offset(8)
        }
        
        addSubview(separator)
        separator.snp.makeConstraints {
            $0.top.equalTo(locationLb.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.height.equalTo(1)
        }
        
        addSubview(weatherImage)
        weatherImage.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-8)
            $0.width.height.equalTo(30)
        }
        
        addSubview(comentLb)
        comentLb.snp.makeConstraints {
            $0.top.equalTo(separator.snp.bottom).offset(10)
            $0.leading.equalTo(weatherImage.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
    }
    
    
}

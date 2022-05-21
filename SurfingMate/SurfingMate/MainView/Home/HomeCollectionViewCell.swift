//
//  HomeCollectionViewCell.swift
//  SurfingMate
//
//  Created by 이동희 on 2022/05/21.
//

import Foundation
import UIKit
import SnapKit
import Alamofire
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    
    private var surfImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7.0
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private var waveMeterLabel: UILabel = { // 따로 받음
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private var waveSecondsLabel: UILabel = { // 따로 받음
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private var paddlePraticeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    //TODO: Model set
    func setup() {
//        setupAttribute()
        setupLayout()
    }
}

private extension HomeCollectionViewCell {
    //TODO:
//    func setupAttribute() { // get/set property using Model
//        if let imageURL = URL(string: Model.imageURL) {
//            surfImageView.kf.setImage(with: imageURL)
//        }
//
//        titleLabel.text = Model.
//        waveMeterLabel.text = Model.
//        waveSecondsLabel.text = Model.
//        paddlePraticeLabel.text = Model.
//    }
    
    func setupLayout() {
        [surfImageView, titleLabel, waveMeterLabel, waveSecondsLabel, paddlePraticeLabel].forEach {
            addSubview($0)
        }
        
        surfImageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(surfImageView.snp.bottom).offset(20)
        }
        
        waveMeterLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        waveSecondsLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(waveMeterLabel.snp.bottom).offset(20)
        }
        
        paddlePraticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(waveSecondsLabel.snp.bottom).offset(20)
        }
    }
    

}

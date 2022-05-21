//
//  CarPoolCell.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import Foundation
import UIKit

class CarPoolCell: UICollectionViewCell {
    
    let subjectiveLb = UILabel().then {
        $0.text = "서울시"
        $0.textColor = UIColor.rgb(red: 122, green: 122, blue: 122)
        $0.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 16)
    }
    
    let mainLb = UILabel().then {
        $0.text = "청년고용지원"
        $0.textColor = UIColor.rgb(red: 38, green: 38, blue: 38)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 19)
    }
    
    let moneyView = UIView()
    
    let maxLb = UILabel().then {
        $0.text = "최대 250만원 지원"
        $0.textColor = UIColor.rgb(red: 255, green: 126, blue: 68)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
    }
    
    let minLb = UILabel().then {
        $0.text = "최소 20만원"
        $0.textColor = UIColor.rgb(red: 123, green: 123, blue: 123)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    }
    
    let dayLb = UILabel().then {
        $0.text = "2021.12.31까지"
        $0.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        $0.textColor = UIColor.rgb(red: 148, green: 148, blue: 148)
    }
    
    let separator = UIView().then {
        $0.backgroundColor = UIColor.rgb(red: 225, green: 225, blue: 225)
    }
    
    let dDayLb = UILabel().then {
        $0.text = "D-63"
        $0.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        $0.textColor = UIColor.rgb(red: 148, green: 148, blue: 148)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 30
    }
    
    private func setupView() {
        backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        
        addSubview(subjectiveLb)
        subjectiveLb.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().offset(-19)
        }
        
        addSubview(mainLb)
        mainLb.snp.makeConstraints {
            $0.top.equalTo(subjectiveLb.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        addSubview(maxLb)
        maxLb.snp.makeConstraints {
            $0.top.equalTo(mainLb.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(22)
        }
        
        addSubview(minLb)
        minLb.snp.makeConstraints {
            $0.bottom.equalTo(maxLb.snp.bottom)
            $0.leading.equalTo(maxLb.snp.trailing).offset(10)
        }
        
        addSubview(dayLb)
        dayLb.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(22)
            $0.top.equalTo(maxLb.snp.bottom).offset(5)
        }
        
        addSubview(separator)
        separator.snp.makeConstraints {
            $0.top.equalTo(maxLb.snp.bottom).offset(7)
            $0.leading.equalTo(dayLb.snp.trailing).offset(8)
            $0.width.equalTo(1)
            $0.height.equalTo(9)
            
        }
        
        addSubview(dDayLb)
        dDayLb.snp.makeConstraints {
            $0.leading.equalTo(separator.snp.trailing).offset(8)
            $0.top.equalTo(maxLb.snp.bottom).offset(5)
        }
        
    }
    
}

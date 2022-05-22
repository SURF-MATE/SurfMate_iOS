//
//  CurrentStatusView.swift
//  SurfingMate
//
//  Created by 이동희 on 2022/05/21.
//

import Foundation
import UIKit
import SnapKit

class CurrentStatusView: UIView {
    private var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 파도"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private var praticeLabel: UILabel = {
        let label = UILabel()
        label.text = "패딩하기 좋은 날씨에요"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "잔잔"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CurrentStatusView {
    func setup() {
        backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        [todayLabel, praticeLabel, descriptionLabel].forEach {
            addSubview($0)
        }
        
        todayLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        praticeLabel.snp.makeConstraints {
            $0.top.equalTo(todayLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(praticeLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

class CurrentDateView: UIView {
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        label.text = "\(dateFormatter.string(from: date))"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "일몰: 04:30"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "일출: 07:30"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
}


extension CurrentDateView {
    func setup() {
        
        backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        
        [dateLabel, sunsetLabel,sunriseLabel].forEach {
            addSubview($0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        sunsetLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(dateLabel.snp.trailing).offset(10)
        }
        
        sunriseLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(sunsetLabel.snp.trailing).offset(10)
        }
    }
}

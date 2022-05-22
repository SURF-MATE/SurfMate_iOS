//
//  InformationTableViewCell.swift
//  SurfingMate
//
//  Created by 이동희 on 2022/05/22.
//

import Foundation
import UIKit
import SnapKit

class DetailHomeViewCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeLabel, windLabel, weatherLabel, waveLabel])
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        return stackView
    }()
    
    public var timeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.text = "오전"
        return label
    }()
    
    public var windLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        
        let attachment = NSTextAttachment()
        let image = UIImage(named: "1-1")!
        let newImage = image.rotate(radians: .pi/2)
        attachment.image = newImage
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "바람")
        myString.append(attachmentString)
        label.attributedText = myString
        
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    public var weatherLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        //label.text = "온도"
        
        let attachment = NSTextAttachment()
        let image = UIImage(named: "1-3")!
        let newImage = image.rotate(radians: .pi/2)
        //attachment.image = UIImage(named: "ico_weather01")
        attachment.image = newImage
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "날씨")
        myString.append(attachmentString)
        label.attributedText = myString
        
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    public var waveLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "1-4")
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "유속")
        myString.append(attachmentString)
        label.attributedText = myString
        
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailHomeViewCell {
    func setupLayouts() {
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        stackView.addArrangedSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30)
            //$0.width.equalTo(30)
            $0.height.equalTo(20)
        }
        
        stackView.addArrangedSubview(windLabel)
        windLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(timeLabel.snp.leading).offset(90)
//            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
        
        stackView.addArrangedSubview(weatherLabel)
        weatherLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(windLabel.snp.leading).offset(100)
//            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
        
        stackView.addArrangedSubview(waveLabel)
        waveLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(weatherLabel.snp.leading).offset(100)
//            $0.width.equalTo(30)
            $0.height.equalTo(20)
        }
    }
}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

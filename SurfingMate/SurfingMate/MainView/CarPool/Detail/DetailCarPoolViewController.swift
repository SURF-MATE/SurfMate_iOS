//
//  DetailCarPoolViewController.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import UIKit
import RxSwift

class DetailCarPoolViewController: UIViewController {
    
    var carPool: CarPool
    
    let dismissBt = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: nil)
    
    let titleLb = UILabel().then {
        $0.text = "제목을 입력하세요."
        $0.textColor = UIColor.rgb(red: 65, green: 63, blue: 81)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 24)
    }
    
    let contentsLb = UILabel().then {
        $0.text = "adskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskladskfjlasldjkfjasdkljfklajskl"
        $0.textColor = UIColor.rgb(red: 65, green: 63, blue: 81)
        $0.numberOfLines = 0
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
    }
    
    let makerLb = UILabel().then {
        $0.text = "개설자"
        $0.textColor = UIColor.rgb(red: 65, green: 63, blue: 81)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
    }
    
    let makerValue = UILabel().then {
        $0.text = "머식"
        $0.textColor = UIColor.rgb(red: 161, green: 161, blue: 161)
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 13)
    }
    
    let stackView = UIView().then {
        $0.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        $0.layer.cornerRadius = 20
    }
    
    let destTitle = UILabel().then {
        $0.text = "목적지"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        $0.textColor = UIColor.rgb(red: 128, green: 128, blue: 128)
    }
    
    let dayTitle = UILabel().then {
        $0.text = "날짜"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        $0.textColor = UIColor.rgb(red: 128, green: 128, blue: 128)
    }
    
    let peopleTitle = UILabel().then {
        $0.text = "인원"
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        $0.textColor = UIColor.rgb(red: 128, green: 128, blue: 128)
    }
    
    let destValue = UILabel().then {
        $0.text = "속초"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        $0.textColor = UIColor.rgb(red: 75, green: 75, blue: 75)
    }
    
    let dayValue = UILabel().then {
        $0.text = "2022/5/30 11:00"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        $0.textColor = UIColor.rgb(red: 75, green: 75, blue: 75)
    }
    
    let peopleValue = UILabel().then {
        $0.text = "1 / 4"
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        $0.textColor = UIColor.rgb(red: 75, green: 75, blue: 75)
    }
    
    let joinBt = UIButton(type: .custom).then {
        $0.setTitle("참가하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = UIColor.rgb(red: 146, green: 206, blue: 242)
        $0.layer.cornerRadius = 27.0
        $0.contentEdgeInsets = UIEdgeInsets(top: 15, left: 134, bottom: 13, right: 131)
        $0.isEnabled = true
    }
    
    let disposeBag = DisposeBag()
    
    init(_ carPool: CarPool) {
        self.carPool = carPool
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setValue()
        bind()
    }
    
    
    
    
}

extension DetailCarPoolViewController {
    
    fileprivate func setValue() {
        titleLb.text = carPool.title
        destValue.text = carPool.destination
        peopleValue.text = "\(carPool.currentCnt) / \(carPool.totalCnt)"
        dayValue.text = carPool.date
        contentsLb.text = carPool.content
        makerValue.text = carPool.nickName
        
    }
    
    fileprivate func bind() {
        dismissBt.rx.tap.subscribe(onNext: {
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        joinBt.rx.tap.subscribe(onNext: {
            
            if self.carPool.currentCnt < self.carPool.totalCnt {
                self.carPool.currentCnt += 1
                self.peopleValue.text = "\(self.carPool.currentCnt) / \(self.carPool.totalCnt)"
            }
            
            if self.carPool.currentCnt == self.carPool.totalCnt {
                self.joinBt.isEnabled = false
                self.joinBt.backgroundColor = UIColor.rgb(red: 195, green: 195, blue: 195)
            }
            
            
        }).disposed(by: disposeBag)
        
    }
    
    fileprivate func setUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = dismissBt
        
        safeView.addSubview(titleLb)
        titleLb.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        safeView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLb.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(80)
        }
        
        stackView.addSubview(destTitle)
        destTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(38)
            $0.top.equalToSuperview().offset(19)
        }
        
        stackView.addSubview(dayTitle)
        dayTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.centerX.equalToSuperview()
        }
        
        stackView.addSubview(peopleTitle)
        peopleTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.trailing.equalToSuperview().offset(-38)
        }
        
        stackView.addSubview(destValue)
        destValue.snp.makeConstraints {
            $0.top.equalTo(destTitle.snp.bottom).offset(10)
            $0.centerX.equalTo(destTitle.snp.centerX)
        }
        
        stackView.addSubview(dayValue)
        dayValue.snp.makeConstraints {
            $0.top.equalTo(dayTitle.snp.bottom).offset(10)
            $0.centerX.equalTo(dayTitle.snp.centerX)
        }
        
        stackView.addSubview(peopleValue)
        peopleValue.snp.makeConstraints {
            $0.top.equalTo(peopleTitle.snp.bottom).offset(10)
            $0.centerX.equalTo(peopleTitle.snp.centerX)
        }
        
        safeView.addSubview(contentsLb)
        contentsLb.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        safeView.addSubview(makerLb)
        makerLb.snp.makeConstraints {
            $0.top.equalTo(contentsLb.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(20)
        }
        
        safeView.addSubview(makerValue)
        makerValue.snp.makeConstraints {
            $0.top.equalTo(contentsLb.snp.bottom).offset(13)
            $0.leading.equalTo(makerLb.snp.trailing).offset(56)
        }
        
        safeView.addSubview(joinBt)
        joinBt.snp.makeConstraints {
            $0.top.equalTo(makerValue.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
    }
}

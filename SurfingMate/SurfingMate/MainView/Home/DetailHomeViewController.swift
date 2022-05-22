//
//  HomeDetailVC.swift
//  SurfingMate
//
//  Created by 이동희 on 2022/05/22.
//

import Foundation
import UIKit
import SnapKit

class DetailHomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAttribute()
        setLayout()
    }
    
    var timeArr = ["3", "6", "9", "12"]
    
    let halfView2 = UIView()
    let halfVIew = UIView()
    
    private lazy var surfingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "1")
        
        return imageView
    }()
    
    private var currentStatusView: UIView = {
        let view = CurrentStatusView()
        view.setup()
        return view
    }()
    
    private var currentDateView: UIView = {
        let view = CurrentDateView()
        view.setup()
        return view
    }()
    
    lazy var informationTableView: UITableView = {
        let tv = UITableView()
        tv.layoutIfNeeded()
        tv.showsVerticalScrollIndicator = false
        tv.showsHorizontalScrollIndicator = false
        return tv
    }()
    
    private func setAttribute() {
        
        informationTableView.delegate = self
        informationTableView.dataSource = self
        informationTableView.isScrollEnabled = true
        
        informationTableView.register(DetailHomeViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setLayout() {
        
        safeView.addSubview(halfVIew)
        halfVIew.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        safeView.addSubview(halfView2)
        halfView2.snp.makeConstraints {
            $0.top.equalTo(halfVIew.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.5)
        }
        
        halfVIew.addSubview(surfingImageView)
        surfingImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.height.equalTo(200)
        }
        
        halfVIew.addSubview(currentStatusView)
        currentStatusView.snp.makeConstraints {
            $0.top.equalTo(surfingImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        halfVIew.addSubview(currentDateView)
        currentDateView.snp.makeConstraints {
            $0.top.equalTo(currentStatusView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        
        halfView2.addSubview(informationTableView)
        informationTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension DetailHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailHomeViewCell
        cell.timeLabel.text = "\(timeArr[indexPath.row])시"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))

        let timeLabel = UILabel()
        timeLabel.frame = CGRect.init(x: 30, y: 5, width: 50, height: headerView.frame.height-10)
        timeLabel.text = "시간"
        timeLabel.font = .systemFont(ofSize: 15, weight: .bold)
        timeLabel.textColor = .black

        let windLabel = UILabel()
        windLabel.frame = CGRect.init(x: 120, y: 5, width: 50, height: headerView.frame.height-10)
        windLabel.text = "바람"
        windLabel.font = .systemFont(ofSize: 15, weight: .bold)
        windLabel.textColor = .black

        let weatherLabel = UILabel()
        weatherLabel.frame = CGRect.init(x: 220, y: 5, width: 50, height: headerView.frame.height-10)
        weatherLabel.text = "날씨"
        weatherLabel.font = .systemFont(ofSize: 15, weight: .bold)
        weatherLabel.textColor = .black

        let waveLabel = UILabel()
        waveLabel.frame = CGRect.init(x: 320, y: 5, width: 50, height: headerView.frame.height-10)
        waveLabel.text = "파도"
        waveLabel.font = .systemFont(ofSize: 15, weight: .bold)
        waveLabel.textColor = .black

        [timeLabel, windLabel, weatherLabel, waveLabel].forEach {
            headerView.addSubview($0)
        }
        headerView.backgroundColor = .white
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

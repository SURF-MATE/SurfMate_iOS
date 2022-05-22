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
import Alamofire

class CarPoolViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let searchBar = CustomTextField(image: UIImage(named: "tfSearch")!, text: "검색")
    
    var filteredData:[CarPool] = []
    let vm = CarPoolViewModel()
    
    let countLb = UILabel().then {
        $0.text = "총 68건"
        $0.textColor = UIColor.rgb(red: 171, green: 171, blue: 171)
        $0.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    var posts:[CarPool] = []
    
    let bookmarkCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.alpha = 1
        return collectionView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCV()
        bind()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
        vm.getPosts()
            .asSignal(onErrorJustReturn: [])
            .emit { posts in
                DispatchQueue.main.async {
                    self.posts = posts
                    self.vm.output.carPools.accept(posts)
                    self.bookmarkCV.reloadData()
                    self.countLb.text = "총 \(posts.count)건"
                }
                
            }.disposed(by: disposeBag)
    }
    
    
    @objc func fetchData() {
        let url = "http://www.debinserver.shop:8080/api/v1/carpool"
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .response { response in
                switch response.result {
                case .success(let value):
                    if let value = value {
                        do {
                            let json = try JSONSerialization.jsonObject(with: value, options: []) as? [String: Any]
                            let result = json?["result"] as? [[String:Any]] ?? []
                            var posts:[CarPool] = []
                            
                            for post in result {
                                let carPool = CarPool(dic: post)
                                posts.append(carPool)
                            }
                            
                            DispatchQueue.main.async {
                                self.posts = posts
                                self.filteredData = posts
                                self.bookmarkCV.reloadData()
                                self.countLb.text = "총 \(posts.count)건"
                            }
                            
                            
                            
                        } catch {
                            DispatchQueue.main.async {
                                let alertController = UIAlertController(title: "에러", message: "네트워크 연결상태를 확인해주세요.", preferredStyle: .alert)
                                alertController.addAction(UIAlertAction(title: "확인", style: .cancel))
                                self.present(alertController, animated: true)
                            }
                        }
                    }
                case .failure(let _):
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "에러", message: "네트워크 연결상태를 확인해주세요.", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "확인", style: .cancel))
                        self.present(alertController, animated: true)
                    }
                }
            }
    }
    
}

extension CarPoolViewController {
    
    fileprivate func setUI() {
        view.backgroundColor = .white
        safeView.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(44)
        }
        
        safeView.addSubview(countLb)
        countLb.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(20)
        }
        
        safeView.addSubview(bookmarkCV)
        bookmarkCV.snp.makeConstraints {
            $0.top.equalTo(countLb.snp.bottom).offset(17)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        bookmarkCV.reloadData()
        
    }
    
    fileprivate func setCV() {
        bookmarkCV.dataSource = self
        bookmarkCV.delegate = self
        bookmarkCV.register(CarPoolCell.self, forCellWithReuseIdentifier: "cell")
        
        
    }
    
    fileprivate func bind() {
        searchBar.rx.text.orEmpty
            .debounce(RxTimeInterval.microseconds(5), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { t in
                self.filteredData = self.posts.filter { $0.content.hasPrefix(t) }
                self.bookmarkCV.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension CarPoolViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarPoolCell
        
        
        let post = filteredData[indexPath.row]
        cell.subjectiveLb.text = post.nickName
        cell.mainLb.text = post.title
        cell.dayLb.text = post.date
        cell.carPool = post
        
        cell.carPool = post
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = filteredData[indexPath.row]
        let vc = DetailCarPoolViewController(post)
        self.present(vc, animated: true)
    }
    
    
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
        return CGSize(width: width, height: 115)
    }
    
    
}

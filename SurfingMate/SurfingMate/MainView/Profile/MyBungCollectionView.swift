//
//  MyBungCollectionView.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/22.
//

import UIKit
import Foundation
import Then
import RxCocoa
import RxSwift
import Alamofire

class MyBungCollectionView: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var posts:[CarPool] = []
    
    let bookmarkCV: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.alpha = 1
        return collectionView
    }()
    
    
    let url:String
    
    init(_ url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCV()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
    }
    
    
    @objc func fetchData() {
        
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
                                self.bookmarkCV.reloadData()
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

extension MyBungCollectionView {
    
    fileprivate func setUI() {
        view.backgroundColor = .white
        
        safeView.addSubview(bookmarkCV)
        bookmarkCV.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        bookmarkCV.reloadData()
        
    }
    
    fileprivate func setCV() {
        bookmarkCV.dataSource = self
        bookmarkCV.delegate = self
        bookmarkCV.register(CarPoolCell.self, forCellWithReuseIdentifier: "cell")
        
        
    }
    
}

extension MyBungCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarPoolCell
        
        
        let post = posts[indexPath.row]
        cell.subjectiveLb.text = post.nickName
        cell.mainLb.text = post.title
        cell.dayLb.text = post.date
        cell.carPool = post
        
        cell.carPool = post
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
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

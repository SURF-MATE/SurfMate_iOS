//
//  CarPoolViewModel.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import Foundation
import UIKit
import RxSwift
import Alamofire
import RxRelay

class CarPoolViewModel {
    
    let input = Input()
    var output = Output()
    
    var disposeBag = DisposeBag()
    struct Input {
        let postsObserver = PublishRelay<Void>()
    }
    
    struct Output {
        var carPools = PublishRelay<[CarPool]>()
    }
    
    init() {
        
    }
    
    func getPosts() -> Observable<[CarPool]> {
        return Observable<[CarPool]>.create { observer in
            
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
                                
                                
                                observer.onNext(posts)
                            } catch {
                                observer.onError(error)
                            }
                        }
                    case .failure(let error):
                        print(error)
                        observer.onError(error)
                    }
                }
            
            
            
            
            return Disposables.create()
        }
    }
    
   
    
    
    
}


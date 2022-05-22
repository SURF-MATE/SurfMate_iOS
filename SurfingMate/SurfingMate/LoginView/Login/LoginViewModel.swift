//
//  LoginViewModel.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire


class LoginViewModel {
    
    var email:String = ""
    var pw:String = ""
    
    let input = Input()
    var output = Output()
    
    struct Input {
        let emailObserver = PublishRelay<String>()
        let pwObserver = PublishRelay<String>()
        let loginObserver = PublishRelay<Void>()
    }
    
    struct Output {
        var emailValid:Driver<Bool> = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        var pwValid:Driver<Bool> = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        var loginValid:Driver<Bool> = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        var doLogin:PublishRelay<Void> = PublishRelay<Void>()
        var doError:PublishRelay<Error> = PublishRelay<Error>()
    }
    
    var disposeBag = DisposeBag()
    
    init() {
        input.emailObserver.subscribe(onNext: { value in
            self.email = value
        }).disposed(by: disposeBag)
        
        input.pwObserver.subscribe(onNext: { value in
            self.pw = value
        }).disposed(by: disposeBag)
        
        input.loginObserver.flatMap(doLogin).subscribe({ event in
            switch event {
            case .next(let _):
                self.output.doLogin.accept(())
            case .error(let error):
                self.output.doError.accept(error)
            case .completed:
                break
            }
        }).disposed(by: disposeBag)
        
        
        output.emailValid = input.emailObserver
            .map { !$0.isEmpty && $0.contains(".") && $0.contains("@")}
            .asDriver(onErrorJustReturn: false)
        
        output.pwValid = input.pwObserver
            .map { $0.validPassword() }
            .asDriver(onErrorJustReturn: false)
        
        output.loginValid = Driver.combineLatest(output.emailValid, output.pwValid)
            .map { $0 && $1 }
            .asDriver(onErrorJustReturn: false)
    }
    
    func doLogin() -> Observable<Void> {
        return Observable<Void>.create { observer in
            let url = "http://www.jwyang.shop:8080/api/v1/member/login"
            let parameters:Parameters = [
                "email": self.email,
                "password":self.pw
            ]
            
            let header:HTTPHeaders = [
                "Content-Type":"application/json"
            ]
            
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header)
                .validate(statusCode: 200..<300)
                .response { response in
                    switch response.result {
                    case .success(let value):
                        if let value = value {
                            do {
                                let json = try JSONSerialization.jsonObject(with: value, options: []) as? [String: Any]
                                let result = json?["description"] as? String ?? ""
                                print(result)
                                observer.onNext(())
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

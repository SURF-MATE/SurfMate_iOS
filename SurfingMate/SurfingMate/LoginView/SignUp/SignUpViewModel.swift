//
//  SignUpViewModel.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire


class SignUpViewModel {
    
    let disposeBag = DisposeBag()
    var user = User()
    
    let input = Input()
    var output = Output()
    
    struct Input {
        let nameObserver = PublishRelay<String>()
        let emailObserver = PublishRelay<String>()
        let pwObserver = PublishRelay<String>()
        let pwConfirmObserver = PublishRelay<String>()
        let genderObserver = PublishRelay<Gender>()
        let birthObserver = PublishRelay<String>()
        let signUpObserver = PublishRelay<Void>()
    }
    
    struct Output {
        var emailValid:Driver = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        var pwValid:Driver = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        var pwConfirmValid:Driver = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        var genderValid:Driver<Gender> = PublishRelay<Gender>().asDriver(onErrorJustReturn: .none)
        var buttonValid:Driver<Bool> = PublishRelay<Bool>().asDriver(onErrorJustReturn: false)
        
        var goSignUp = PublishRelay<User>()
        var errorValue = PublishRelay<Error>()
    }
    
    init() {
        
        input.nameObserver.subscribe(onNext: { valid in
            self.user.nickName = valid
        }).disposed(by: disposeBag)
        
        input.emailObserver.subscribe(onNext: { valid in
            self.user.email = valid
        }).disposed(by: disposeBag)
        
        input.pwObserver.subscribe(onNext: { valid in
            self.user.password = valid
        }).disposed(by: disposeBag)
        
        
        
        input.genderObserver.subscribe(onNext: { valid in
            switch valid {
            case .male:
                self.user.sex = "남성"
            case .female:
                self.user.sex = "여성"
            case .none:
                break
            }
        }).disposed(by: disposeBag)
        
        input.birthObserver.subscribe(onNext: { valid in
            let year = Int(valid.components(separatedBy: " / ")[0]) ?? 0
            let age = 2023 - year
            self.user.age = age
            print(age)
        }).disposed(by: disposeBag)
        
        input.signUpObserver.flatMap(signUp).subscribe( { event in
            switch event {
            case .next(let user) :
                self.output.goSignUp.accept(user)
            case .error(let error):
                self.output.errorValue.accept(error)
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
        
        output.pwConfirmValid = Driver.combineLatest(input.pwObserver.asDriver(onErrorJustReturn: ""), input.pwConfirmObserver.asDriver(onErrorJustReturn: ""))
            .map { $0 == $1}
            .asDriver(onErrorJustReturn: false)
        
        output.genderValid = input.genderObserver.asDriver(onErrorJustReturn: .none)
        
        output.buttonValid = Driver.combineLatest(output.emailValid, output.pwValid, input.nameObserver.asDriver(onErrorJustReturn: ""), input.genderObserver.asDriver(onErrorJustReturn: .none), input.birthObserver.asDriver(onErrorJustReturn: ""), output.pwConfirmValid).map { a, b, c, d, e, f in
            if a && b {
                if c != "" && d != .none {
                    if e != "" && f {
                        return true
                    }
                }
            }
            return false
        }.asDriver(onErrorJustReturn: false)
        
    }
    
    func signUp() -> Observable<User> {
        
        return Observable.create { observer in
            let url = "http://jwyang.shop:8080/api/v1/member/signup"
            let parameter = self.user.toDic()
            
            let header:HTTPHeaders = [
                "Content-Type":"application/json"
            ]
            
            AF.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header)
                .validate(statusCode: 200..<300)
                .response { response in
                    switch response.result {
                    case .success(let value):
                        if let value = value {
                            do {
                                let json = try JSONSerialization.jsonObject(with: value, options: []) as? [String: Any]
                                let result = json?["description"] as? String ?? ""
                                print(result)
                                observer.onNext(self.user)
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

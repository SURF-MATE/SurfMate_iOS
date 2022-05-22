//
//  User.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import Foundation
import Alamofire


class User: Codable {
    
    var email: String = ""
    var password:String = ""
    var nickName:String = ""
    var age: Int = 0
    var sex: String = ""
    
    
    func toDic() -> Parameters {
        let parameter:Parameters = [
            "email": self.email,
            "password" : self.password,
            "checkPassword":self.password,
            "age": self.age,
            "nickName": self.nickName,
            "sex": self.sex
        ]
        
        
        return parameter
    }
    
}


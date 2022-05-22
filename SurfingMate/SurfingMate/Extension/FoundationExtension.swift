//
//  FoundationExtension.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/21.
//

import Foundation

extension String {
    
    func validPassword() -> Bool {
        let passwordreg = ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        return passwordtesting.evaluate(with: self)
    }
    
    var cEncoding:String {
        var temp = self
        let escapeChars = [";", "/", "?", ":",
         "@" , "&" , "=" , "+" ,
         "$" , "," , "[" , "]",
         "#", "!", "'", "(",
         ")", "*", "."]
        
        let replaceChars = ["%3B", "%2F", "%3F", "%3A",
        "%40", "%26", "%3D", "%2B",
        "%24", "%2C", "%5B", "%5D",
        "%23", "%21", "%27", "%28",
        "%29", "%2A", "%2E"]
            
        for char in temp {
            if let index = escapeChars.firstIndex(of: String(char)) {
                temp = temp.replacingOccurrences(of: escapeChars[index], with: replaceChars[index])
            }
        }
            
        return temp
    }
}

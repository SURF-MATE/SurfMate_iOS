//
//  CarPool.swift
//  SurfingMate
//
//  Created by Jun on 2022/05/22.
//

import Foundation

struct CarPool {
    var content:String = ""
    var title:String = ""
    var date:String = ""
    var destination:String = ""
    var id: Int = 0
    var nickName:String = ""
    var totalCnt:Int = 0
    var currentCnt:Int = 0
    
    init() {
        
    }
    
    
    init(dic: [String:Any]) {
        self.content = (dic["content"] as? String ?? "").cEncoding
        self.date = (dic["date"] as? String ?? "").cEncoding
        self.destination = (dic["destination"] as? String ?? "").cEncoding
        self.id = dic["id"] as? Int ?? 0
        self.nickName = (dic["nickName"] as? String ?? "").cEncoding
        self.totalCnt = dic["totalCnt"] as? Int ?? 0
        self.currentCnt = dic["currentCnt"] as? Int ?? 0
        self.title = (dic["title"] as? String ?? "").cEncoding
    }
}

//
//  Models.swift
//  AlchemintProject
//
//  Created by WuQiaoqiao on 2018/9/13.
//  Copyright © 2018年 com.alchemintTeam.wuqiaoqiao. All rights reserved.
//

import Foundation

class BaseModel: Codable {
     
}

class ReqBaseModel: BaseModel {
    
}

class GetUtxoModel2: ReqBaseModel {
    
    var address = "111"
    var name = "222"
    
    
}

class People {
    let age = 15
    let name = "小红"
}

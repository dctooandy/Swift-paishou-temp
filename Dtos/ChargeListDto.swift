//
//  ChargeListDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

class ChargeListDto: Codable {
    var list:[ChargeListDataDto]?
    var total:Int?
    
    init(
        list:[ChargeListDataDto] = [ChargeListDataDto()],
        total:Int = 0
    )
    {
        self.list = list
        self.total = total
    }
}
class ChargeListDataDto:Codable {
    let orderno: String?
    let addtime: Double?
    let coin: Int?
    let money: Double?
    let rules_type: Int?
    let status: Int?
    let type: Int?
    init(
        orderno:String = "default",
        addtime:Double = 0.0,
        coin:Int = 0,
        money:Double = 0.0,
        rules_type:Int = 0,
        status:Int = 0,
        type:Int = 0
    )
    {
        self.orderno = orderno
        self.addtime = addtime
        self.coin = coin
        self.money = money
        self.rules_type = rules_type
        self.status = status
        self.type = type
    }
}

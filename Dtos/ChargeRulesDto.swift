//
//  ChargeRulesDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class ChargeRulesDto: Codable{
    let coin: Int?
    let list: [ChargeRulesListDto]?
    init(coin: Int = 0, list: [ChargeRulesListDto] = [ChargeRulesListDto()]) {
        self.coin = coin
        self.list = list
    }
    
}
class ChargeRulesListDto: Codable{
    
    let coin: Int?
    let give: Int?
    let id: Int?
    let money: Double?
    let money_ios: Double?
    let name: String?
    let product_id: String?
    
    init(coin: Int = 0,
         give: Int = 0,
         id: Int = 0,
         money:  Double = 0,
         money_ios: Double = 0,
         name: String = "",
         product_id: String = "") {
        self.coin = coin
        self.give = give
        self.money = money
        self.money_ios = money_ios
        self.name = name
        self.product_id = product_id
        self.id = id
    }
}
class ChargeAlipayUrlDto: Codable{
    let pay_url: String?
    init(url: String = "") {
        self.pay_url = url
    }
}

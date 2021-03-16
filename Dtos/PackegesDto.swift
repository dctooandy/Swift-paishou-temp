//
//  PackegesDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/16.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class PackegesDto: Codable{
    let gift_list: [PackegesListDto]?
    init(list: [PackegesListDto] = [PackegesListDto()]) {
        self.gift_list = list
    }
}
class PackegesListDto: Codable{
    let id: Int?
    let giftname: String?
    let giftexplain: String?
    let needcoin: Int?//礼物价格
    let gifticon: String?//图片
    let quantity: Int?
    let is_special: JSONValue?
    init(id: Int = 0,
         giftname: String = "",
         giftexplain: String = "",
         needcoin: Int = 0,
         gifticon: String = "",
         quantity: Int = 0,
         is_special: JSONValue = JSONValue.bool(false)) {
        self.id = id
        self.giftname = giftname
        self.giftexplain = giftexplain
        self.needcoin = needcoin
        self.gifticon = gifticon
        self.quantity = quantity
        self.is_special = is_special
    }
}

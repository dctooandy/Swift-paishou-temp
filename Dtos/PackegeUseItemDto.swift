//
//  PackegeUseItemDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/19.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class PackegeUseItemDto: Codable{
    
    let gift_list: [PackegeUseSubItemsDto]?
    init(gift_list: [PackegeUseSubItemsDto] = [PackegeUseSubItemsDto()]) {
        self.gift_list = gift_list
    }
    
}
class PackegeUseSubItemsDto: Codable{
    let giftname: String?
    let gifticon: String?
    let quantity: Int?
    init(giftname: String = "", gifticon: String = "", quantity: Int = 0) {
        self.giftname = giftname
        self.gifticon = gifticon
        self.quantity = quantity
    }
}

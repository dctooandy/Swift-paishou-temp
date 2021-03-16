//
//  BackpackSendGiftDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/18.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class BackpackSendGiftDto: Codable{
    let gifttoken: String?
    let level: Int?
    let coin: Int?
    init(gifttoken: String = "", level: Int = 0, coin: Int = 0) {
        self.gifttoken = gifttoken
        self.level = level
        self.coin = coin
    }
}

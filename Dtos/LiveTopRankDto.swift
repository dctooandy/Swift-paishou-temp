//
//  LiveTopRankDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/15.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
//排行榜dto
class LiveTopRankDto: Codable{
    
    let daily: [LiveTopRankItemDto]?
    let week: [LiveTopRankItemDto]?
    let month: [LiveTopRankItemDto]?
    
    init(daily: [LiveTopRankItemDto] = [LiveTopRankItemDto()],
         week: [LiveTopRankItemDto] = [LiveTopRankItemDto()],
         month: [LiveTopRankItemDto] = [LiveTopRankItemDto()]) {
        self.daily = daily
        self.week = week
        self.month = month
    }
}
class LiveTopRankItemDto: Codable{
    
    let id: Int? //用戶ID
    let user_nicename: String? //用戶暱稱
    let avatar: String? //用戶頭像
    let num: String? //打賞總額
    let level: Int?//用戶等級
    
    init(id: Int = 0,
         user_nicename: String = "",
         avatar: String = "",
         num: String = "",
         level: Int = 0) {
        self.id = id
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.num = num
        self.level = level
    }
}

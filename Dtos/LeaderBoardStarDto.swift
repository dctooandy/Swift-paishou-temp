//
//  LeaderBoardDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

//明星榜
class LeaderBoardStarDto: Codable{
    
    let anchor: [LeaderBoardStarItemDto]?
    let member: [LeaderBoardStarItemDto]?
    
    init(anchor: [LeaderBoardStarItemDto] = [LeaderBoardStarItemDto()],
         member: [LeaderBoardStarItemDto] = [LeaderBoardStarItemDto()]) {
        self.anchor = anchor
        self.member = member
    }
    
}

class LeaderBoardStarItemDto: Codable{
    
    let id: Int?
    let level: Int?
    let avatar: String?
    let user_nicename: String?
    
    init(id: Int = 0,
         level: Int = 0,
         avatar: String = "",
         user_nicename: String = "") {
        self.id = id
        self.level = level
        self.avatar = avatar
        self.user_nicename = user_nicename
    }
    
}
//富豪榜
class LeaderBoardZillionaireDto: Codable{
    let anchor: [LeaderBoardZillionaireItemDto]?
    let member: [LeaderBoardZillionaireItemDto]?
    
    init(anchor: [LeaderBoardZillionaireItemDto] = [LeaderBoardZillionaireItemDto()],
         member: [LeaderBoardZillionaireItemDto] = [LeaderBoardZillionaireItemDto()]) {
        self.anchor = anchor
        self.member = member
    }
}
class LeaderBoardZillionaireItemDto: Codable{
    
    let id: Int?
    let level: Int?
    let avatar: String?
    let user_nicename: String?
    let num: Int?
    
    init(id: Int = 0,
         level: Int = 0,
         avatar: String = "",
         user_nicename: String = "",
         num: Int = 0) {
        self.id = id
        self.level = level
        self.avatar = avatar
        self.user_nicename = user_nicename
        self.num = num
    }
    
}

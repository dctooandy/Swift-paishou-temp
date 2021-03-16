//
//  LiveNewLiveListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2021/1/5.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import Foundation
class LiveNewLiveListDto: Codable{
    let list: [LiveNewLiveDto]?
    init(list: [LiveNewLiveDto] = [LiveNewLiveDto()]) {
        self.list = list
    }
}
class LiveNewLiveDto: Codable{
    
    let user_nicename: String?
    let avatar: String?
    let thumb: String?
    let stream: String?
    let title: String?
    let signature: String?
    let nums: String?
    let city: String?
    let uid: Int?
    let islive: Int?
    let type: Int?
    
    init(user_nicename: String = "",
         avatar: String = "",
         thumb: String = "",
         stream: String = "",
         title: String = "",
         signature: String = "",
         nums: String = "",
         city: String = "",
         uid: Int = 0,
         islive: Int = 0,
         type: Int = 0) {
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.thumb = thumb
        self.stream = stream
        self.title = title
        self.signature = signature
        self.nums = nums
        self.city = city
        self.uid = uid
        self.islive = islive
        self.type = type
    }
    
}

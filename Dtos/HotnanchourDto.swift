//
//  HotnanchourDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/23.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class HotnanchourDto: Codable
{
    let list:[HotnanchourListDto]?
    init(list:[HotnanchourListDto] = [HotnanchourListDto()]) {
        self.list = list
    }
}
class HotnanchourListDto: Codable {
    let user_nicename :String?
    let avatar :String?
    let thumb :String?
    let stream :String?
    let title :String?
    let city :String?
    let signature :String?
    let nums :String?
    let uid :Int?
    let islive :Int?
    let type :Int?
    
    init(user_nicename : String = "",
         avatar : String = "",
         thumb : String = "",
         stream : String = "",
         title : String = "",
         city : String = "",
         signature : String = "",
         nums : String = "",
         uid : Int = 0,
         islive : Int = 0,
         type : Int = 0
    ) {
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.thumb = thumb
        self.stream = stream
        self.title = title
        self.city = city
        self.signature = signature
        self.nums = nums
        self.uid = uid
        self.islive = islive
        self.type = type
    }
    
}

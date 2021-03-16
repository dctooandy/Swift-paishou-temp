//
//  FollowsListDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/3.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class FollowsListDto: Codable {
    let list :[FollowsListDataDto]?
    func total() -> Int?
    {
        if self.list?.first?.avatar == "default"
        {
            return 0
        }else
        {
            return self.list?.count ?? 0
        }
    }
    init(list :[FollowsListDataDto] = [FollowsListDataDto()]) {
        self.list = list
    }
}

class FollowsListDataDto: Codable {
    let avatar :String?
    let city :String?
    let goodnum :String?
    let nums :String?
    let pull :String?
    let stream :String?
    let thumb :String?
    let title :String?
    let type_val :String?
    let user_nicename :String?
    let starttime :Double?
    let anyway :Int?
    let isvideo :Int?
    let level :Int?
    let sex :Int?
    let type :Int?
    let uid :Int?
    let level_anchor :Int?
    let live_type :String?
    // 1118
    let signature : String?
    let is_live : JSONValue?
    var custom_is_attant: Bool?
    // 0114
    let liveclassid :JSONValue?
    init(avatar : String = "default",
         city : String = "",
         goodnum : String = "",
         nums : String = "",
         pull : String = "",
         stream : String = "",
         thumb : String = "",
         title : String = "",
         type_val : String = "",
         user_nicename : String = "",
         starttime : Double = 0.0,
         anyway : Int = 0,
         isvideo : Int = 0,
         level : Int = 0,
         sex : Int = 0,
         type : Int = 0,
         uid : Int = 0,
         level_anchor : Int = 0,
         live_type : String = "",
         signature : String = "",
         is_live : JSONValue = JSONValue.int(0),
         custom_is_attant : Bool = true,
         liveclassid: JSONValue = JSONValue.int(0)
         )
    {
        self.avatar = avatar
        self.city = city
        self.goodnum = goodnum
        self.nums = nums
        self.pull = pull
        self.stream = stream
        self.thumb = thumb
        self.title = title
        self.type_val = type_val
        self.user_nicename = user_nicename
        self.starttime = starttime
        self.anyway = anyway
        self.isvideo = isvideo
        self.level = level
        self.sex = sex
        self.type = type
        self.uid = uid
        self.level_anchor = level_anchor
        self.live_type = live_type
        self.signature = signature
        self.is_live = is_live
        self.custom_is_attant = custom_is_attant
        self.liveclassid = liveclassid
    }
}

//
//  ClassLiveDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class ClassLiveDto: Codable {
    let list:[ClassLiveInfoDto]?
    let code:Int?
    let msg:String?
    let info:[ClassLiveInfoDto]?
    
    init(code:Int = 0,
         msg:String = "",
         info:[ClassLiveInfoDto] = [ClassLiveInfoDto()],
         list:[ClassLiveInfoDto] = [ClassLiveInfoDto()])
    {
        self.code = code
        self.msg = msg
        self.info = info
        self.list = list
    }
}
class ClassLiveInfoDto: Codable {

    let avatar:String?
    let city:String?
    let islive:Int?
    let nums:String?
    let signature:String?
    let stream:String?
    let thumb:String?
    let title:String?
    let type:JSONValue?
    let uid:JSONValue?
    let user_nicename:String?
    
    let live_type:String?
    let pull:String?
    let isvideo:String?
    let type_val:String?
    let game_action:String?
    let goodnum:String?
    let anyway:String?
    let starttime:String?
    let avatar_thumb:String?
    let sex:String?
    let level:String?
    let level_anchor:String?
    let game:String?
    
    //0114
    let liveclassid:JSONValue?

    init(
        avatar:String = "",
        city:String = "",
        islive:Int = 0,
        nums:String = "",
        signature:String = "",
        stream:String = "",
        thumb:String = "",
        title:String = "",
        type:JSONValue = JSONValue.int(0),
        uid:JSONValue = JSONValue.int(0),
        user_nicename:String = "",
        
        live_type:String = "",
        pull:String = "",
        isvideo:String = "",
        type_val:String = "",
        game_action:String = "",
        goodnum:String = "",
        anyway:String = "",
        starttime:String = "",
        avatar_thumb:String = "",
        sex:String = "",
        level:String = "",
        level_anchor:String = "",
        game:String = "",
        liveclassid:JSONValue = JSONValue.int(0)
    )
    {
        self.avatar = avatar
        self.city = city
        self.islive = islive
        self.nums = nums
        self.signature = signature
        self.stream = stream
        self.thumb = thumb
        self.title = title
        self.type = type
        self.uid = uid
        self.user_nicename = user_nicename
        
        self.live_type = live_type
        self.pull = pull
        self.isvideo = isvideo
        self.type_val = type_val
        self.game_action = game_action
        self.goodnum = goodnum
        self.anyway = anyway
        self.starttime = starttime
        self.avatar_thumb = avatar_thumb
        self.sex = sex
        self.level = level
        self.level_anchor = level_anchor
        self.game = game
        self.liveclassid = liveclassid
    }
}

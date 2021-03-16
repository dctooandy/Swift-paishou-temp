//
//  HotDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class HotDto: Codable {
    let code:Int?
    let msg:String?
    let info:[HotInfoDto]?
    
    init(code:Int = 0,
         msg:String = "",
         info:[HotInfoDto] = [HotInfoDto()])
    {
        self.code = code
        self.msg = msg
        self.info = info
    }
}
class HotInfoDto: Codable {
    let list:[HotInfoListDto]?
    let slide:[HotInfoSlideDto]?
    
    
    init(list:[HotInfoListDto] = [HotInfoListDto()],
         slide:[HotInfoSlideDto] = [HotInfoSlideDto()]
         )
    {
        self.list = list
        self.slide = slide
    }
}
class HotSlideDto: Codable {
    let list:[HotInfoSlideDto]?
    
    init(list:[HotInfoSlideDto] = [HotInfoSlideDto()]
         )
    {
        self.list = list
    }
}

class HotInfoSlideDto: Codable {
    let slide_pic:String?
    let slide_url:String?
    let title:String?
    
    let slide_content:String?
    let slide_des:String?
    let slide_id:Int?
    let slide_name:String?
    
    init(slide_pic:String = "",
         slide_url:String = "",
         title:String = "",
         slide_content:String = "",
         slide_des:String = "",
         slide_id:Int = 0,
         slide_name:String = ""
         )
    {
        self.slide_pic = slide_pic
        self.slide_url = slide_url
        self.title = title
        self.slide_content = slide_content
        self.slide_des = slide_des
        self.slide_id = slide_id
        self.slide_name = slide_name
    }
}
class HotLiveDto: Codable {
    let list:[HotInfoListDto]?
    
    init(list:[HotInfoListDto] = [HotInfoListDto()]
         )
    {
        self.list = list
    }
}
class HotInfoListDto: Codable {
 
    let uid:Int?
    let title:String?
    let live_type:String?
    let score_id:String?
    let city:String?
    let stream:String?
    let pull:String?
    let thumb:String?
    
    let isvideo:String?
    let type:Int?
    let type_val:String?
    let game_action:String?
    let goodnum:String?
    let anyway:String?
    let nums:String?
    let avatar:String?
    let avatar_thumb:String?
    let user_nicename:String?
    let sex:String?
    let level:String?
    let level_anchor:String?
    let game:String?
    let pullflv:String?
    let pullm3u8:String?
    
    let islive:Int?
    let signature:String?
    // 0114
    let liveclassid:JSONValue?
    init(
        uid:Int = 0,
        title:String = "",
        live_type:String = "",
        score_id:String = "",
        city:String = "",
        stream:String = "",
        pull:String = "",
        thumb:String = "",
        isvideo:String = "",
        type:Int = 0,
        type_val:String = "",
        game_action:String = "",
        goodnum:String = "",
        anyway:String = "",
        nums:String = "",
        avatar:String = "",
        avatar_thumb:String = "",
        user_nicename:String = "",
        sex:String = "",
        level:String = "",
        level_anchor:String = "",
        game:String = "",
        pullflv:String = "",
        pullm3u8:String = "",
        islive:Int = 0,
        signature:String = "",
        liveclassid:JSONValue = JSONValue.int(0)
    )
    {
        self.uid = uid
        self.title = title
        self.live_type = live_type
        self.score_id = score_id
        self.city = city
        self.stream = stream
        self.pull = pull
        self.thumb = thumb
        self.isvideo = isvideo
        self.type = type
        self.type_val = type_val
        self.game_action = game_action
        self.goodnum = goodnum
        self.anyway = anyway
        self.nums = nums
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.user_nicename = user_nicename
        self.sex = sex
        self.level = level
        self.level_anchor = level_anchor
        self.game = game
        self.pullflv = pullflv
        self.pullm3u8 = pullm3u8
        self.islive = islive
        self.signature = signature
        self.liveclassid = liveclassid
    }
}

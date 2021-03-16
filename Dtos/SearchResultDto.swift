//
//  SearchResultDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/17.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation

class SearchResultDto: Codable{
    var liver_list : [SearchLiverListDto]?
    var room_list : [SearchRoomListDto]?
    var game_list : [SearchGameListDto]?
    
    init(liver_list: [SearchLiverListDto] = [SearchLiverListDto()],
         room_list: [SearchRoomListDto] = [SearchRoomListDto()],
         game_list: [SearchGameListDto] = [SearchGameListDto()]
    ) {
        self.liver_list = liver_list
        self.room_list = room_list
        self.game_list = game_list
    }
}

class SearchLiverListDto: Codable{
    let avatar: String?
    let level_anchor_info: ScheduleListAnchorInfoNew? //我猜應該是有開播的直播主資訊
    let signature: String?
    let user_nicename: String?
    let uid: Int?
    let follow: Bool?
    // 1117
    // 測試
    let isAttent:JSONValue?
    
    init(avatar: String = "default",
         level_anchor_info: ScheduleListAnchorInfoNew = ScheduleListAnchorInfoNew(),
         signature: String = "",
         user_nicename: String = "",
         uid: Int = 0,
         follow: Bool = false,
         isAttent : JSONValue = JSONValue.int(0)
    ) {
        self.avatar = avatar
        self.level_anchor_info = level_anchor_info
        self.signature = signature
        self.user_nicename = user_nicename
        self.uid = uid
        self.follow = follow
        self.isAttent = isAttent
    }
}

class SearchRoomListDto: Codable{
    let avatar: String?
    let live_id: Int?
    let room_heat: Int?
    let thumb: String?
    let title: String?
    let user_nicename: String?
    //0115
    let liveclassid:JSONValue?
    
    init(avatar: String = "default",
         live_id: Int = 0,
         room_heat: Int = 0,
         thumb: String = "",
         title: String = "",
         user_nicename: String = "",
         liveclassid:JSONValue = JSONValue.int(0)
    ) {
        self.avatar = avatar
        self.live_id = live_id
        self.room_heat = room_heat
        self.thumb = thumb
        self.title = title
        self.user_nicename = user_nicename
        self.liveclassid = liveclassid
    }
}

class SearchGameListDto: Codable{
    let anchor_info: [ScheduleListAnchorInfoNew]? //我猜應該是有開播的直播主資訊
    let away_logo: String?
    let away_name: String?
    let classid: Int?
    let date: String?
    let eid: Int?
    let home_logo: String?
    let home_name: String?
    var is_appointment: Bool?
    let islive: Bool?
    let time: String?
    let title: String?
    //0118
    let live_anchor_info: [ScheduleListAnchorInfoNew]? //正在直播的直播主資訊
    init(
        anchor_info: [ScheduleListAnchorInfoNew] = [ScheduleListAnchorInfoNew()],
        away_logo: String = "default",
        away_name: String = "",
        classid: Int = 0,
        date: String = "",
        eid: Int = 0,
        home_logo: String = "",
        home_name: String = "",
        is_appointment: Bool = false,
        islive: Bool = false,
        time: String = "",
        title: String = "",
        live_anchor_info: [ScheduleListAnchorInfoNew] = [ScheduleListAnchorInfoNew()]
    ) {
        self.anchor_info = anchor_info
        self.away_logo = away_logo
        self.away_name = away_name
        self.classid = classid
        self.date = date
        self.eid = eid
        self.home_logo = home_logo
        self.home_name = home_name
        self.is_appointment = is_appointment
        self.islive = islive
        self.time = time
        self.title = title
        self.live_anchor_info = live_anchor_info
    }
}

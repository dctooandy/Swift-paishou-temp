//
//  ScheduleListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/3.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class ScheduleListDto: Codable{
    
    let total: Int?
    let list: [ScheduleListSubitemDto]?
    
    init(total: Int = 0,
         list: [ScheduleListSubitemDto] = [ScheduleListSubitemDto()])
    {
        self.total = total
        self.list = list
    }
    
}
class ScheduleListSubitemDto: Codable,Equatable{
    static func == (lhs: ScheduleListSubitemDto, rhs: ScheduleListSubitemDto) -> Bool {
        return
            lhs.alog == rhs.alog &&
            lhs.anchor_info == rhs.anchor_info &&
            lhs.live_anchor_info == rhs.live_anchor_info &&
            lhs.away == rhs.away &&
            lhs.begin1 == rhs.begin1 &&
            lhs.begin_date == rhs.begin_date &&
            lhs.cn == rhs.cn &&
            lhs.hlog == rhs.hlog &&
            lhs.home == rhs.home &&
            lhs.begin == rhs.begin &&
            lhs.eid == rhs.eid &&
            lhs.cid == rhs.cid &&
            lhs.classid == rhs.classid &&
            lhs.id == rhs.id &&
            lhs.is_appointment == rhs.is_appointment &&
            lhs.is_live == rhs.is_live
    }
    

    let alog: String? //客隊圖
    let anchor_info: [ScheduleListAnchorInfoNew]? //我猜應該是有開播的直播主資訊
    let live_anchor_info: [ScheduleListAnchorInfoNew]? //正在直播的直播主資訊
    let away: String? //客隊名
    let begin1: String? //開賽時間Str
    let begin_date: String? //開賽日期
    let cn: String? //賽事名
    let hlog: String? //主隊圖
    let home: String? //主隊名
    
    let begin: Double? //開賽時間搓
    let eid: Int?
    let cid: Int?
    let classid: Int?
    let id: Int?
    var is_appointment: Bool? //有沒有預約
    let is_live: Bool? //有沒有直播中 0:沒有 1:有
    
    init(alog: String = "",
         anchor_info: [ScheduleListAnchorInfoNew] = [ScheduleListAnchorInfoNew()],
         live_anchor_info: [ScheduleListAnchorInfoNew] = [ScheduleListAnchorInfoNew()],
         away: String = "",
         begin1: String = "",
         begin_date: String = "",
         cn: String = "",
         hlog: String = "",
         home: String = "",
         begin: Double = 0,
         eid: Int = 0,
         cid: Int = 0,
         classid: Int = 0,
         id: Int = 0,
         is_appointment: Bool = false,
         is_live: Bool = false
    ) {
        self.alog = alog
        self.anchor_info = anchor_info
        self.live_anchor_info = live_anchor_info
        self.away = away
        self.begin1 = begin1
        self.begin_date = begin_date
        self.cn = cn
        self.hlog = hlog
        self.home = home
        self.begin = begin
        self.eid = eid
        self.cid = cid
        self.classid = classid
        self.id = id
        self.is_appointment = is_appointment
        self.is_live = is_live
    }
    
}

//class ScheduleListAnchorInfo: Codable{
//    let experience_now:JSONValue?
//    let experience_percent:JSONValue?
//    let experience_up:JSONValue?
//    let level:Int?
//    let level_name:String?
//    let thumb:String?
//    let thumb_mark:String?
//
//    init(
//        experience_now: JSONValue = JSONValue.int(0),
//        experience_percent: JSONValue = JSONValue.int(0),
//        experience_up: JSONValue = JSONValue.int(0),
//        level: Int = 0,
//        level_name: String = "",
//        thumb: String = "",
//        thumb_mark: String = ""
//    )
//    {
//        self.experience_now = experience_now
//        self.experience_percent = experience_percent
//        self.experience_up = experience_up
//        self.level = level
//        self.level_name = level_name
//        self.thumb = thumb
//        self.thumb_mark = thumb_mark
//
//    }
//}
class ScheduleListAnchorInfoNew: Codable,Equatable{
    static func == (lhs: ScheduleListAnchorInfoNew, rhs: ScheduleListAnchorInfoNew) -> Bool {
        return
            lhs.id?.intValue == rhs.id?.intValue &&
            lhs.user_nicename == rhs.user_nicename &&
            lhs.avatar == rhs.avatar &&
            lhs.signature == rhs.signature &&
            lhs.customIsLive == rhs.customIsLive &&
            lhs.experience_now?.intValue == rhs.experience_now?.intValue &&
            lhs.experience_percent?.intValue == rhs.experience_percent?.intValue &&
            lhs.experience_up?.intValue == rhs.experience_up?.intValue &&
        lhs.level == rhs.level &&
        lhs.level_name == rhs.level_name &&
        lhs.thumb == rhs.thumb &&
        lhs.thumb_mark == rhs.thumb_mark
    }
    let id: JSONValue?
    let user_nicename: String?
    let avatar: String?
    let signature: String?
    var customIsLive:Bool?
    // 0118
    let experience_now:JSONValue?
    let experience_percent:JSONValue?
    let experience_up:JSONValue?
    let level:Int?
    let level_name:String?
    let thumb:String?
    let thumb_mark:String?
    
    init(id: JSONValue = JSONValue.int(0),
         user_nicename: String = "狗狗",
         avatar: String = "https://imgcdn.njetp.com/uploads/20191102/64fd944c-c5ad-4f0a-8eb7-a081cc9b1c8e.jpg",
         signature: String = "",
         customIsLive:Bool = false,
         experience_now: JSONValue = JSONValue.int(0),
         experience_percent: JSONValue = JSONValue.int(0),
         experience_up: JSONValue = JSONValue.int(0),
         level: Int = 0,
         level_name: String = "",
         thumb: String = "",
         thumb_mark: String = "") {
        self.id = id
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.signature = signature
        self.customIsLive = customIsLive
        self.experience_now = experience_now
        self.experience_percent = experience_percent
        self.experience_up = experience_up
        self.level = level
        self.level_name = level_name
        self.thumb = thumb
        self.thumb_mark = thumb_mark
    }
    
    static func liveUPData(lhs: ScheduleListAnchorInfoNew, rhs: ScheduleListAnchorInfoNew) -> Bool {
        return (lhs.customIsLive?.intValue ?? 0) > (rhs.customIsLive?.intValue ?? 0)
    }
}

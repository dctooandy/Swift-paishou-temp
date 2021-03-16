//
//  BroadCastingListenDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class BroadCastingListenDto: Codable {
    let msg : [BroadCastingListenDataDto]?
    let retcode : String?
    let retmsg : String?
    
    init(msg : [BroadCastingListenDataDto] = [BroadCastingListenDataDto()],
         retcode:String = "",
         retmsg:String = ""
    )
    {
        self.msg = msg
        self.retcode = retcode
        self.retmsg = retmsg
    }
}
class BroadCastingListenDataDto: Codable {
    let _method_ : String?
    let action : JSONValue?
    let msgtype : JSONValue?
    let ct : JSONValue?
    
    let guard_type : String?
    let level : JSONValue?
    let liangname : String?
    let roomnum : JSONValue?
    let uname : String?
    let sex : String?
    let timestamp : String?
    let tougood : String?
    let touid : String?
    let toname : JSONValue?
    let ugood : String?
    let uhead : String?
    let uid : String?
    let usign : String?
    let equipment : String?
    let city : String?
    let usertype : Int?
    let userTypeColor : String?
    let vip_type : Int?
    let isAnchor : Int?
    let pkuid1 : String?
    let pkuid2 : String?
    let pktotal1 : String?
    let pktotal2 : String?
    // 1019
    let adminRooms:String?
    
    init(_method_:String = "",
         action:JSONValue = JSONValue.string(""),
         ct:JSONValue = JSONValue.string(""),
         msgtype:JSONValue = JSONValue.string(""),
         guard_type:String = "",
         level:JSONValue =  JSONValue.string(""),
         liangname:String = "",
         roomnum:JSONValue =  JSONValue.string(""),
         uname:String = "",
         sex:String = "",
         timestamp:String = "",
         tougood:String = "",
         touid:String = "",
         toname:JSONValue =  JSONValue.string(""),
         ugood:String = "",
         uhead:String = "",
         uid:String = "",
         usign:String = "",
         equipment:String = "",
         city:String = "",
         usertype:Int = 0,
         userTypeColor:String = "",
         vip_type:Int = 0,
         isAnchor:Int = -99,
         pkuid1:String = "",
         pkuid2:String = "",
         pktotal1:String = "",
         pktotal2:String = "",
         adminRooms:String = ""
         ) {
        self._method_ = _method_
        self.action = action
        self.ct = ct
        self.msgtype = msgtype
        self.guard_type = guard_type
        self.level = level
        self.liangname = liangname
        self.roomnum = roomnum
        self.uname = uname
        self.sex = sex
        self.timestamp = timestamp
        self.tougood = tougood
        self.touid = touid
        self.toname = toname
        self.ugood = ugood
        self.uhead = uhead
        self.uid = uid
        self.usign = usign
        self.equipment = equipment
        self.city = city
        self.usertype = usertype
        self.userTypeColor = userTypeColor
        self.vip_type = vip_type
        self.isAnchor = isAnchor
        self.pkuid1 = pkuid1
        self.pkuid2 = pkuid2
        self.pktotal1 = pktotal1
        self.pktotal2 = pktotal2
        self.adminRooms = adminRooms
    }
    
    
    
    var ctString: String {
        if let ct = ct?.stringValue {
            return ct
        }
        return ""
    }
    var ctDiction: ctDataDto? {
        if (ct?.dictionValue) != nil {
            let decoder = JSONDecoder()
            do {
                if let data = try? JSONSerialization.data(withJSONObject: ct?.values as Any, options: [])
                {
                    let results = try decoder.decode(ctDataDto.self, from:data)
                    if let contentString = results.content
                    {
//                        Log.v("results : \(contentString)")
                    }
                    return results
                }else
                {
                    return ctDataDto()
                }
            } catch DecodingError.dataCorrupted( _) {
                Log.e("dataCorrupted")
            } catch DecodingError.keyNotFound( _,  _) {
                Log.e("keyNotFound")
            } catch DecodingError.typeMismatch( _,  _) {
                Log.e("typeMismatch")
            } catch DecodingError.valueNotFound( _,  _) {
                Log.e("valueNotFound")
            } catch {
                Log.e(error.localizedDescription)
            }
        }
        return ctDataDto()
    }
    //JsonValue 需要注意轉確定型別 
    var asdDictionary: [String: Any] {
        return ["_method_": _method_!,
                "action":action?.intValue ?? 0,
                "ct":ctString,
                "equipment":equipment ?? "",
                "isAnchor":isAnchor ?? -99,
                "level": level?.intValue ?? 0,
                "msgtype":msgtype?.intValue ?? 0,
                "roomnum":roomnum?.intValue ?? 0,
                "uhead": uhead ?? "",
                "uid": uid ?? "",
                "uname": uname ?? "",
                "usertype":usertype ?? 0,
                "vip_type":vip_type ?? 0,
                "touid":touid ?? "",
                "userTypeColor":userTypeColor ?? "",
                "adminRooms":adminRooms ?? ""
        ]
    }
    var sbDictionary: NSDictionary {
        return asdDictionary as NSDictionary
    }
}
class ctDataDto: Codable {
    let id : JSONValue? // 進出直播間 有ID 沒UID
    let user_nicename : String?
    let avatar : String?
    let avatar_thumb : String?
    let level : JSONValue?
    let usertype : JSONValue?
    let vip_type : JSONValue?
    let guard_type : JSONValue?
    let liangname : String?
    let car_id : JSONValue?
    let car_swf : String?
    let car_swftime : String?
    let car_words : String?
    // 彈幕
    let uid:JSONValue? // 傳接消息 有UID 沒ID
    let content : String?
    let giftid:Int?
    let giftcount:Int?
    let totalcoin:Int?
    let giftname : String?
    let gifticon : String?
    let coin:JSONValue?
    let votestotal:JSONValue?
    let barragetoken : String?
    let roomheat:Int?
    let room_heat:Int?
    let donate_total:Int?
    // 禮物
    let type:JSONValue?
    let mark:JSONValue?
    let swftime:JSONValue?
    let swftype:JSONValue?
    let swf:JSONValue?
    let isluck:String?
    let isluckall:String?
    let luckcoin:String?
    let lucktimes:String?
    let isup:String?
    let uplevel:String?
    let upcoin:String?
    let iswin:String?
    let wincoin:String?
    let gifttoken:String?
    // 0104
    let room_status:Bool?
    let title : String?
    init(id:JSONValue = JSONValue.string(""),
         user_nicename:String = "",
         avatar:String = "",
         avatar_thumb:String = "",
         level:JSONValue = JSONValue.string(""),
         usertype:JSONValue = JSONValue.string(""),
         vip_type:JSONValue = JSONValue.string(""),
         guard_type:JSONValue = JSONValue.string(""),
         liangname:String = "",
         car_id:JSONValue = JSONValue.string(""),
         car_swf:String = "",
         car_swftime:String = "",
         car_words:String = "",
         
         uid:JSONValue = JSONValue.int(0),
         content:String = "",
         giftid:Int = 0,
         giftcount:Int = 0,
         totalcoin:Int = 0,
         giftname:String = "",
         gifticon:String = "",
         coin:JSONValue = JSONValue.string(""),
         votestotal:JSONValue = JSONValue.string(""),
         barragetoken:String = "",
         roomheat:Int = 0,
         room_heat:Int = 0,
         donate_total:Int = 0,
         
         type:JSONValue = JSONValue.int(0),
         mark:JSONValue = JSONValue.int(0),
         swftime:JSONValue = JSONValue.double(0.0),
         swftype:JSONValue = JSONValue.int(0),
         swf:JSONValue = JSONValue.string(""),
         isluck:String = "",
         isluckall:String = "",
         luckcoin:String = "",
         lucktimes:String = "",
         isup:String = "",
         uplevel:String = "",
         upcoin:String = "",
         iswin:String = "",
         wincoin:String = "",
         gifttoken:String = "",
         room_status:Bool = false,
         title:String = ""
        
         ) {
        self.id = id
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.level = level
        self.usertype = usertype
        self.vip_type = vip_type
        self.guard_type = guard_type
        self.liangname = liangname
        self.car_id = car_id
        self.car_swf = car_swf
        self.car_swftime = car_swftime
        self.car_words = car_words
        
        self.uid = uid
        self.content = content
        self.giftid = giftid
        self.giftcount = giftcount
        self.totalcoin = totalcoin
        self.giftname = giftname
        self.gifticon = gifticon
        self.coin = coin
        self.votestotal = votestotal
        self.barragetoken = barragetoken
        self.roomheat = roomheat
        self.room_heat = room_heat
        self.donate_total = donate_total
        
        self.type = type
        self.mark = mark
        self.swftime = swftime
        self.swftype = swftype
        self.swf = swf
        self.isluck = isluck
        self.isluckall = isluckall
        self.luckcoin = luckcoin
        self.lucktimes = lucktimes
        self.isup = isup
        self.uplevel = uplevel
        self.upcoin = upcoin
        self.iswin = iswin
        self.wincoin = wincoin
        self.gifttoken = gifttoken
        self.room_status = room_status
        self.title = title
    }
}

//
//  EnterRoomDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
class EnterRoomDto: Codable {
    let code:Int?
    let msg:String?
    let info:[EnterRoomInfoDto]?
    
    init(code:Int = 0,
         msg:String = "",
         info:[EnterRoomInfoDto] = [EnterRoomInfoDto()] )
    {
        self.code = code
        self.msg = msg
        self.info = info
    }
}
class EnterRoomInfoDto: Codable {
    let barrage_fee : String?
    let barrage_limit : String?
    let chatserver : String?
    let coin : String?
    let game : [EnterRoomGameInfoDto]?
    let game_banker_avatar : String?
    let game_banker_limit : String?
    let game_banker_name : String?
    let game_bankerid : String?
    let gameaction : String?
    let gamebet : [EnterRoomGameBatInfoDto]?
    let gameid : String?
    let gametime : String?
    let `guard` : EnterRoomGuardInfoDto?
    let guard_nums : String?
    let isattention : String?
    let isred : String?
    let issuper : String?
    let jackpot_level : String?
    let kick_time : String?
    let liang : EnterRoomLiangInfoDto?
    let linkmic_pull : String?
    let linkmic_uid : String?
    let live_type : String?
    let liveinfo : EnterRoomLiveinfoDto?
    let liveuser : EnterRoomUserKindDto?
    let nums : String?
    let pkinfo : EnterRoomPKinfoDto?
    let pull : String?
    let shut_time : String?
    let speak_limit : String?
    let stream : String?
    let thumb : String?
    let userinfo : EnterRoomUserKindDto?
    let userlist_time : String?
    let userlists : [EnterRoomUserKindDto]?
    let usertype : String?
    let userTypeColor : String?
    let vip:EnterRoomVIPInfoDto?
    let votestotal:String?
    init(barrage_fee : String = "",
         barrage_limit : String = "",
         chatserver : String = "",
         coin : String = "" ,
         game : [EnterRoomGameInfoDto] = [EnterRoomGameInfoDto()],
         game_banker_avatar : String = "",
         game_banker_limit : String = "" ,
         game_banker_name : String = "",
         game_bankerid : String = "",
         gameaction : String = "",
         gamebet : [EnterRoomGameBatInfoDto] = [EnterRoomGameBatInfoDto()],
         gameid : String = "",
         gametime : String = "",
         `guard` : EnterRoomGuardInfoDto = EnterRoomGuardInfoDto(),
         guard_nums : String = "",
         isattention : String = "",
         isred : String = "",
         issuper : String = "",
         jackpot_level : String = "",
         kick_time : String = "",
         liang : EnterRoomLiangInfoDto = EnterRoomLiangInfoDto(),
         linkmic_pull : String = "",
         linkmic_uid : String = "",
         live_type : String = "",
         liveinfo : EnterRoomLiveinfoDto = EnterRoomLiveinfoDto(),
         liveuser : EnterRoomUserKindDto = EnterRoomUserKindDto(),
         nums : String = "",
         pkinfo : EnterRoomPKinfoDto = EnterRoomPKinfoDto(),
         pull : String = "",
         shut_time : String = "",
         speak_limit : String = "",
         stream : String = "",
         thumb : String = "",
         userinfo : EnterRoomUserKindDto = EnterRoomUserKindDto(),
         userlist_time : String = "",
         userlists : [EnterRoomUserKindDto] = [EnterRoomUserKindDto()],
         usertype : String = "",
         userTypeColor : String = "",
         vip : EnterRoomVIPInfoDto = EnterRoomVIPInfoDto(),
         votestotal : String = "")
    {
        self.barrage_fee = barrage_fee
        self.barrage_limit = barrage_limit
        self.chatserver = chatserver
        self.coin = coin
        self.game = game
        self.game_banker_avatar = game_banker_avatar
        self.game_banker_limit = game_banker_limit
        self.game_banker_name = game_banker_name
        self.game_bankerid = game_bankerid
        self.gameaction = gameaction
        self.gamebet = gamebet
        self.gameid = gameid
        self.gametime = gametime
        self.`guard` = `guard`
        self.guard_nums = guard_nums
        self.isattention = isattention
        self.isred = isred
        self.issuper = issuper
        self.jackpot_level = jackpot_level
        self.kick_time = kick_time
        self.liang = liang
        self.linkmic_pull = linkmic_pull
        self.linkmic_uid = linkmic_uid
        self.live_type = live_type
        self.liveinfo = liveinfo
        self.liveuser = liveuser
        self.nums = nums
        self.pkinfo = pkinfo
        self.pull = pull
        self.shut_time = shut_time
        self.speak_limit = speak_limit
        self.stream = stream
        self.thumb = thumb
        self.userinfo = userinfo
        self.userlist_time = userlist_time
        self.userlists = userlists
        self.usertype = usertype
        self.userTypeColor = userTypeColor
        self.vip = vip
        self.votestotal = votestotal
    }
}
class EnterRoomGameInfoDto: Codable
{
    // 缺資料
}
class EnterRoomGameBatInfoDto: Codable
{
    // 缺資料
}
class EnterRoomGuardInfoDto: Codable
{
    // 缺資料
    let endtime :String?
    let type :String?
    init(endtime : String = "",
         type : String = "")
    {
        self.endtime = endtime
        self.type = type
    }
}
class EnterRoomLiangInfoDto: Codable
{
    // 缺資料
    let name :String?
    init(name : String = "")
    {
        self.name = name
    }
}
class EnterRoomLiveinfoDto: Codable
{
    // 缺資料
    let type :String?
    let type_msg :String?
    let type_val :String?
    init(type : String = "",
         type_msg : String = "",
         type_val : String = "")
    {
        self.type = type
        self.type_msg = type_msg
        self.type_val = type_val
    }
}
class EnterRoomVIPInfoDto: Codable
{
    // 缺資料
}

class EnterRoomPKinfoDto: Codable
{
    // 缺資料
    let ifpk :String?
    let pk_gift_liveuid :String?
    let pk_gift_pkuid :String?
    let pk_time :String?
    let pkpull :String?
    let pkuid :String?
    init(ifpk : String = "",
         pk_gift_liveuid : String = "",
         pk_gift_pkuid : String = "",
         pk_time : String = "",
         pkpull : String = "",
         pkuid : String = "")
    {
        self.ifpk = ifpk
        self.pk_gift_liveuid = pk_gift_liveuid
        self.pk_gift_pkuid = pk_gift_pkuid
        self.pk_time = pk_time
        self.pkpull = pkpull
        self.pkuid = pkuid
    }
}

class EnterRoomUserinfoCarDto: Codable
{
    let id :String?
    let swf :String?
    let swftime :String?
    let words :String?
    init(id : String = "",
         swf : String = "",
         swftime : String = "",
         words : String = ""
    ) {
        self.id = id
        self.swf = swf
        self.swftime = swftime
        self.words = words
    }
}
class EnterRoomUserKindDto: Codable
{
    let avatar:String?
    let avatar_thumb:String?
    let birthday:String?
    let car:EnterRoomUserinfoCarDto?
    let city:String?
    let coin:String?
    let consumption:String?
    let contribution:String?
    let guard_type:String?
    let id:String?
    let issuper:String? //userlists 有
    let level:String?
    let level_anchor:String?
    let liang : EnterRoomLiangInfoDto?
    let province:String?
    let sex:String?
    let sign:String?//userinfo 有
    let signature:String?
    let user_nicename:String?
    let user_status:String?
    let usertype : Int?//userinfo 有
    let vip:EnterRoomVIPInfoDto?
    let votestotal:String?
    
    init( avatar:String = "",
          avatar_thumb:String = "",
          birthday:String = "",
          car:EnterRoomUserinfoCarDto = EnterRoomUserinfoCarDto(),
          city:String = "",
          coin:String = "",
          consumption:String = "",
          contribution:String = "",
          guard_type:String = "",
          id:String = "",
          issuper:String = "",
          
          level:String = "",
          level_anchor:String = "",
          liang : EnterRoomLiangInfoDto = EnterRoomLiangInfoDto(),
          province:String = "",
          sex:String = "",
          sign:String = "",
          signature:String = "",
          user_nicename:String = "",
          user_status:String = "",
          usertype:Int = 0,
          vip:EnterRoomVIPInfoDto = EnterRoomVIPInfoDto(),
          votestotal:String = ""
    )
    {
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.birthday = birthday
        self.car = car
        self.city = city
        self.coin = coin
        self.consumption = consumption
        self.contribution = contribution
        self.guard_type = guard_type
        self.id = id
        self.issuper = issuper
        
        self.level = level
        self.level_anchor = level_anchor
        self.liang = liang
        self.province = province
        self.sex = sex
        self.sign = sign
        self.signature = signature
        self.user_nicename = user_nicename
        self.user_status = user_status
        self.usertype = usertype
        self.vip = vip
        self.votestotal = votestotal
        
    }
}

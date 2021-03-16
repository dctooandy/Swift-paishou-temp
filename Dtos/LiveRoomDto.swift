//
//  LiveRoomDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/15.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift

class LiveRoomDto: Codable{
    static var share:LiveRoomDto?
      {
          didSet {
              guard let share = share else { return }
              subject.onNext(share)
          }
      }
      static var rxShare:Observable<LiveRoomDto?> = subject
          .do(onNext: { value in
              if share == nil {
                  _ = update()
              }
          })
      static let disposeBag = DisposeBag()
      static private let subject = BehaviorSubject<LiveRoomDto?>(value: nil)
      static func update() -> Observable<()>{
          let subject = PublishSubject<Void>()

          return subject.asObservable()
      }
    
    
    let anchor: LiveRoomPeopleDto?
    let live: LiveRoomLiveDto?
    let user: LiveRoomPeopleDto?
    let follows: Int?
    let fans: Int?
    let send_coins: Int?
    let chat_server: String? //Socket的key
    let isattent: Int?
    let experlevel: [LiveRoomExperlevelItemDto]?
    let live_notice: [LiveRoomNoticeItemDto]?
    // 1109
    let banner : [LiveBannerDto]?
    
    init(anchor: LiveRoomPeopleDto = LiveRoomPeopleDto(),
         live: LiveRoomLiveDto = LiveRoomLiveDto(),
         user: LiveRoomPeopleDto = LiveRoomPeopleDto(),
         follows: Int = 0,
         fans: Int = 0,
         send_coins: Int = 0,
         chat_server: String = "",
         isattent: Int = 0,
         experlevel: [LiveRoomExperlevelItemDto] = [LiveRoomExperlevelItemDto()],
         live_notice: [LiveRoomNoticeItemDto] = [LiveRoomNoticeItemDto()],
         banner : [LiveBannerDto] = [LiveBannerDto()])
    {
        self.anchor = anchor
        self.live = live
        self.user = user
        self.follows = follows
        self.fans = fans
        self.send_coins = send_coins
        self.chat_server = chat_server
        self.isattent = isattent
        self.experlevel = experlevel
        self.live_notice = live_notice
        self.banner = banner
    }
    
}

class LiveRoomPeopleDto: Codable{
    
    let id: Int?
    let user_login: String?
    let user_nicename: String?
    let user_email: String?
    let user_url: String?
    let avatar: String?
    let avatar_thumb: String?
    let sex: String?
    let birthday: String?
    let signature: String?
    let last_login_ip: String?
    let last_login_time: String?
    let create_time: String?
    let user_activation_key: String?
    let user_status: Int?
    let score: Int?
    let user_type: Int?
    let coin: Int?
    let mobile: String?
    let token: String?
    let expiretime: Int?
    let consumption: Int?
    let votes: Int?
    let votestotal: Int?
    let province: String?
    let city: String?
    let isrecommend: Int?
    let openid: String?
    let login_type: String?
    let iszombie: Int?
    let isrecord: Int?
    let iszombiep: Int?
    let issuper: Int?
    let ishot: Int?
    let goodnum: String?
    let source: String?
    let cashbacktime: Int?
    let lotterytime: Int?
    let qqgroup: String?
    let lotterysum: Int?
    let level: Int?
    let level_anchor: Int?
    let sign: String?
    let usertype: Int?//用户类型
    let fans_num: Int?//粉丝数
    let vip: LiveRoomVipDto?
    let liang: LiveRoomLiangDto?
    
    // 1019
    func identityFromUserInfo(liveRoomID : Int) -> Int{
        return (UserInfoDto.share?.returnUserType(withRoomID: liveRoomID ))!
    }
    func identityColor(liveRoomID : Int) -> String{
        return (UserInfoDto.share?.returnUserTypeColor(withRoomID: liveRoomID ))!
    }
    // 暫時無用
     let identity: Int? //身份身份身份(新版1:一般 2:VIP 3:房管 4:直播主 5:商戶號 6:公會會長)
     var identityColorWithString : String{
         switch self.identity {
         case 1:return "#70BBFF"
         case 2:break
         case 3:return "#6FCF37"
         case 4:return "#E1AF62"
         case 5:break
         case 6:break
         default: break
         }
         return ""
     }
    
    
    init(id: Int = 0,
         user_login: String = "",
         user_nicename: String = "",
         user_email: String = "",
         user_url: String = "",
         avatar: String = "",
         avatar_thumb: String = "",
         sex: String = "",
         birthday: String = "",
         signature: String = "",
         last_login_ip: String = "",
         last_login_time: String = "",
         create_time: String = "",
         user_activation_key: String = "",
         user_status: Int = 0,
         score: Int = 0,
         user_type: Int = 0,
         coin: Int = 0,
         mobile: String = "",
         token: String = "",
         expiretime: Int = 0,
         consumption: Int = 0,
         votes: Int = 0,
         votestotal: Int = 0,
         province: String = "",
         city: String = "",
         isrecommend: Int = 0,
         openid: String = "",
         login_type: String = "",
         iszombie: Int = 0,
         isrecord: Int = 0,
         iszombiep: Int = 0,
         issuper: Int = 0,
         ishot: Int = 0,
         goodnum: String = "",
         source: String = "",
         cashbacktime: Int = 0,
         lotterytime: Int = 0,
         qqgroup: String = "",
         lotterysum: Int = 0,
         level: Int = 0,
         level_anchor: Int = 0,
         sign: String = "",
         usertype: Int = 0,
         fans_num: Int = 0,
         vip: LiveRoomVipDto = LiveRoomVipDto(),
         liang: LiveRoomLiangDto = LiveRoomLiangDto(),
         identity: Int = 0) {
        
        self.id = id
        self.user_login = user_login
        self.user_nicename = user_nicename
        self.user_email = user_email
        self.user_url = user_url
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.sex = sex
        self.birthday = birthday
        self.signature = signature
        self.last_login_ip = last_login_ip
        self.last_login_time = last_login_time
        self.create_time = create_time
        self.user_activation_key = user_activation_key
        self.user_status = user_status
        self.score = score
        self.user_type = usertype
        self.coin = coin
        self.mobile = mobile
        self.token = token
        self.expiretime = expiretime
        self.consumption = consumption
        self.votes = votes
        self.votestotal = votestotal
        self.province = province
        self.city = city
        self.isrecommend = isrecommend
        self.openid = openid
        self.login_type = login_type
        self.iszombie = iszombie
        self.isrecord = isrecord
        self.iszombiep = iszombiep
        self.issuper = issuper
        self.ishot = ishot
        self.goodnum = goodnum
        self.source = source
        self.cashbacktime = cashbacktime
        self.lotterytime = lotterytime
        self.qqgroup = qqgroup
        self.lotterysum = lotterysum
        self.level = level
        self.level_anchor = level_anchor
        self.sign = sign
        self.usertype = usertype//用户类型
        self.fans_num = fans_num//粉丝数
        self.vip = vip
        self.liang = liang
        self.identity = identity
    }
    
}
class LiveRoomVipDto: Codable{
    
    let additionalProp1: Int?
    let additionalProp2: Int?
    let additionalProp3: Int?
    let type: Int?
    init(additionalProp1: Int = 0,
         additionalProp2: Int = 0,
         additionalProp3: Int = 0,
         type: Int = 0) {
        self.additionalProp1 = additionalProp1
        self.additionalProp2 = additionalProp2
        self.additionalProp3 = additionalProp3
        self.type = type
    }
}
class LiveRoomLiangDto: Codable{
    
    let additionalProp1: Int?
    let additionalProp2: Int?
    let additionalProp3: Int?
    let type: Int?
    init(additionalProp1: Int = 0,
         additionalProp2: Int = 0,
         additionalProp3: Int = 0,
         type: Int = 0) {
        self.additionalProp1 = additionalProp1
        self.additionalProp2 = additionalProp2
        self.additionalProp3 = additionalProp3
        self.type = type
    }
}

class LiveRoomLiveDto: Codable{
    
    let uid: Int?//用户id
    let showid: Int?//直播标识
    let islive: Int?//直播状态
    let starttime: Int?//开播时间
    let title: String?//标题
    let score_id: Int?//比分ID
    let province: String?//省份
    let city: String?//城市
    let stream: String?//流名
    let thumb: String?//封面图
    let pull: String?//播流地址
    let pull_flv: String?//播流地址
    let pull_m3u8: String?//播流地址
    let lng: String?//经度
    let lat: String?//维度
    let type: Int?//直播类型
    let type_val: String?//类型值
    let live_type: String?//video
    let isvideo: Int?//是否假视频
    let wy_cid: String?//网易房间ID(当不使用网易是默认为空)
    let game_action: Int?//游戏类型
    let banker_coin: Int?//平台庄家余额
    let goodnum: String?//靓号
    let anyway: Int?//横竖屏，0表示竖屏，1表示横屏
    let liveclassid: Int?//直播分类ID
    let hotvotes: Int?//热门礼物总额
    let pkuid: Int?//PK对方ID
    let pkstream: String?//pk对方的流名
    let ismic: Int?//连麦开关，0是关，1是开
    let ishot: Int?//是否热门
    let isrecommend: Int?//是否推荐
    let deviceinfo: String?//设备信息
    let refreshtime: Int?//主播app上次在线时间
    let fans_nums: Int?//主播app上次在线时间
    let push: String?//推流地址
    let room_heat: Int?//直播間熱度
    let donate_total: Int?//斗內
    //0104
    let room_code:JSONValue?
    let room_status:String?
    
    init(uid: Int = 0,
         showid: Int = 0,
         islive: Int = 0,
         starttime: Int = 0,
         title: String = "",
         score_id: Int = 0,
         province: String = "",
         city: String = "",
         stream: String = "",
         thumb: String = "",
         pull: String = "",
         pull_flv: String = "",
         pull_m3u8: String = "",
         lng: String = "",
         lat: String = "",
         type: Int = 0,
         type_val: String = "",
         live_type: String = "",
         isvideo: Int = 0,
         wy_cid: String = "",
         game_action: Int = 0,
         banker_coin: Int = 0,
         goodnum: String = "",
         anyway: Int = 0,
         liveclassid: Int = 0,
         hotvotes: Int = 0,
         pkuid: Int = 0,
         pkstream: String = "",
         ismic: Int = 0,
         ishot: Int = 0,
         isrecommend: Int = 0,
         deviceinfo: String = "",
         refreshtime: Int = 0,
         fans_nums: Int = 0,
         push: String = "",
         room_heat: Int = 0,
         donate_total: Int = 0,
         room_code:JSONValue = JSONValue.int(0),
         room_status:String = "") {
        self.uid = uid
        self.showid = showid
        self.islive = islive
        self.starttime = starttime
        self.title = title
        self.score_id = score_id
        self.province = province
        self.city = city
        self.stream = stream
        self.thumb = thumb
        self.pull = pull
        self.pull_flv = pull_flv
        self.pull_m3u8 = pull_m3u8
        self.lng = lng
        self.lat = lat
        self.type = type
        self.type_val = type_val
        self.live_type = live_type
        self.isvideo = isvideo
        self.wy_cid = wy_cid
        self.game_action = game_action
        self.banker_coin = banker_coin
        self.goodnum = goodnum
        self.anyway = anyway
        self.liveclassid = liveclassid
        self.hotvotes = hotvotes
        self.pkuid = pkuid
        self.pkstream = pkstream
        self.ismic = ismic
        self.ishot = ishot
        self.isrecommend = isrecommend
        self.deviceinfo = deviceinfo
        self.refreshtime = refreshtime
        self.fans_nums = fans_nums
        self.push = push
        self.room_heat = room_heat
        self.donate_total = donate_total
        self.room_code = room_code
        self.room_status = room_status
    }
}


class LiveRoomExperlevelItemDto: Codable{
    
    let levelid: Int?
    let levelname: String?
    let level_up: Int?
    let addtime: Int?
    let id: Int?
    let thumb: String?
    let colour: String?
    let thumb_mark: String?
    
    init(levelid: Int = 0,
         levelname: String = "",
         level_up: Int = 0,
         addtime: Int = 0,
         id: Int = 0,
         thumb: String = "",
         colour: String = "",
         thumb_mark: String = ""){
        self.levelid = levelid
        self.levelname = levelname
        self.level_up = level_up
        self.addtime = addtime
        self.id = id
        self.thumb = thumb
        self.colour = colour
        self.thumb_mark = thumb_mark
    }
    
}

class LiveRoomNoticeItemDto: Codable{
    let notice: String? //通知标题公告
    let info: String? //通知内容介绍
    
    init(notice: String = "", info: String = "") {
        self.notice = notice
        self.info = info
    }
}
class LiveBannerDto:Codable
{
    let action:Int?
    let content:String?
    let title:String?
    init(
        action:Int = 0,
        content:String = "",
        title:String = ""
    )
    {
        self.action = action
        self.content = content
        self.title = title
    }
}

//
//  UserInfoDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/25.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import RxSwift
class UserInfoDto: Codable {
    static var share:UserInfoDto?
    {
        didSet {
            guard let share = share else { return }
            subject.onNext(share)
        }
    }
    static var rxShare:Observable<UserInfoDto?> = subject
        .do(onNext: { value in
            if share == nil {
                _ = update(done: {})
            }
        })
    static let disposeBag = DisposeBag()
    static private let subject = BehaviorSubject<UserInfoDto?>(value: nil)
    static func update(done: @escaping () -> Void) -> Observable<()>{
        let subject = PublishSubject<Void>()
        Beans.userServer.fetchUserInfo().subscribeSuccess({ (userInfoDto) in
            share = userInfoDto
            share?.isNeedHeadOffNaviPopEvent = false
            _ = LoadingViewController.dismiss()
            done()
            subject.onNext(())
        }).disposed(by: disposeBag)
        return subject.asObservable()
    }
    // Login才有
    let isrecord:Int?
    let user_type:Int?
    let fans_num:Int?
    let is_anchor:Int?
    let id:Int?
    var level:Int?                      // 用户等级
    let issuper:Int?                   // 是否被超管 yes 不允许切换放假
    let qqgroup:String?
    let avatar_thumb:String?
    let votes:Int?                   // 映票数
    let ishot:Int?
    let lotterytime:Int?
    let score:Int?
    let votestotal:Int?                 // 总映票数
    var coin:Int?                       // 钻石数
    let level_anchor:Int?               // 主播等级
    let sex:String?                        // 性别
    let user_email:String?
    let user_login:String?
    let create_time:String?
    let user_status:Int?                // 用户状态
    let user_url:String?
    let birthday:String?                // 生日
    let red_coin:Int?
    let source:String?
    let lotterysum:Int?
    let usertype:Int?
    let city:String?                    // 城市
    let avatar:String?
    let login_type:String?              // 登录类型
    let user_nicename:String?
    let mobile:String?
    let consumption:Int?                // 消费总额
    let province:String?                // 省份
    let liang:PSLiangModelDto?
    let iszombiep:Int?
    let sign:String?
    let isrecommend:Int?
    let goodnum:String?
    let signature:String?               // 签名
    let cashbacktime:Int?
    let vip:PSVipModelDto?
    let iszombie:Int?
    let identities:[PSIdentitiesDto]?
    let banana: Int?
    let level_anchor_info: PSLevelAnchorInfoDto?
    //2020/12/18 判斷是否要攔截pop事件
    var isNeedHeadOffNaviPopEvent: Bool?
    init(
        isrecord:Int = 0,
        user_type:Int = 0,
        fans_num:Int = 0,
        is_anchor:Int = 0,
        id:Int = 0,
        level:Int = 0,
        issuper:Int = 0,
        qqgroup:String = "",
        avatar_thumb:String = "",
        votes:Int = 0,
        ishot:Int = 0,
        lotterytime:Int = 0,
        score:Int = 0,
        votestotal:Int = 0,
        coin:Int = 0,
        level_anchor:Int = 0,
        sex:String = "",
        user_email:String = "",
        user_login:String = "",
        create_time:String = "",
        user_status:Int = 0,
        user_url:String = "",
        birthday:String = "",
        red_coin:Int = 0,
        source:String = "",
        lotterysum:Int = 0,
        usertype:Int = 0,
        city:String = "",
        avatar:String = "",
        login_type:String = "",
        user_nicename:String = "",
        mobile:String = "",
        consumption:Int = 0,
        province:String = "",
        liang:PSLiangModelDto = PSLiangModelDto(),
        iszombiep:Int = 0,
        sign:String = "",
        isrecommend:Int = 0,
        goodnum:String = "",
        signature:String = "",
        cashbacktime:Int = 0,
        vip:PSVipModelDto = PSVipModelDto(),
        iszombie:Int = 0,
        identities:[PSIdentitiesDto] = [PSIdentitiesDto()],
        banana: Int = 0,
        level_anchor_info: PSLevelAnchorInfoDto = PSLevelAnchorInfoDto(),
        isNeedHeadOffNaviPopEvent: Bool = false
    )
    {
        self.isrecord = isrecord
        self.user_type = user_type
        self.fans_num = fans_num
        self.is_anchor = is_anchor
        self.id = id
        self.level = level
        self.issuper = issuper
        self.qqgroup = qqgroup
        self.avatar_thumb = avatar_thumb
        self.votes = votes
        self.ishot = ishot
        self.lotterytime = lotterytime
        self.score = score
        self.votestotal = votestotal
        self.coin = coin
        self.level_anchor = level_anchor
        self.sex = sex
        self.user_email = user_email
        self.user_login = user_login
        self.create_time = create_time
        self.user_status = user_status
        self.user_url = user_url
        self.birthday = birthday
        self.red_coin = red_coin
        self.source = source
        self.lotterysum = lotterysum
        self.usertype = usertype
        self.city = city
        self.avatar = avatar
        self.login_type = login_type
        self.user_nicename = user_nicename
        self.mobile = mobile
        self.consumption = consumption
        self.province = province
        self.liang = liang
        self.iszombiep = iszombiep
        self.sign = sign
        self.isrecommend = isrecommend
        self.goodnum = goodnum
        self.signature = signature
        self.cashbacktime = cashbacktime
        self.vip = vip
        self.iszombie = iszombie
        self.identities = identities
        self.banana = banana
        self.level_anchor_info = level_anchor_info
        self.isNeedHeadOffNaviPopEvent = isNeedHeadOffNaviPopEvent
    }
    
    
    var roomsData :[Int]
    {
        if let idArray = self.identities
        {
            for idData in idArray {
                if idData.identity == 3
                {
                    return idData.rooms!.values as! [Int]
                }
            }
        }
        return []
    }
    var toJsonString: String {
        do {
            let jsonData = try self.jsonData()
            //            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
            //                  guard let dictionary = json as? [String : Any] else {
            //                    return [:]
            //                  }
            //            return dictionary as Dictionary
            // Use dictionary
            
            guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                return ""
            }
            return jsonString
            //                  // Print jsonString
            //                  print(jsonString)
        } catch  {
            
        }
        return ""
    }
    // 1019
    func returnUserType(withRoomID:Int) -> Int
    {
        if let idArray = self.identities
        {
            for idData in idArray {
                if idData.identity == 4
                {
                    return 4
                }
            }
        }
        if withRoomID == self.id
        {
            return 4
        }else
        {
            if self.roomsData.contains(withRoomID) == true
            {
                return 3
            }else
            {
                return 1
            }
        }
        
    }
    func returnUserTypeColor(withRoomID:Int) -> String
    {
        if let hotRate = self.identities?.first?.hot_rate ,
            hotRate != -99
        {
//            let identityArray: [PSIdentitiesDto] = self.identities!.sorted(by: { (dto1, dto2) -> Bool in return dto1.identity! > dto2.identity!})
//            let identityInt = identityArray.last?.identity
//            switch identityInt {
//            case 1: // 一般
//                return "#70BBFF"
//            case 2: // VIP
//                break
//            case 3: // 房管
//                return "#6FCF37"
//            case 4: // 直播主
//                return "#E1AF62"
//            case 5: // 商戶號
//                break
//            case 6: // 公會會長
//                break
//            default:
//                break
//            }
            if let idArray = self.identities
            {
                for idData in idArray {
                    if idData.identity == 4
                    {
                        return "#E1AF62"
                    }
                }
            }
            if withRoomID == self.id
            {
                return "#E1AF62"
            }else
            {
                if self.roomsData.contains(withRoomID) == true
                {
                    return "#6FCF37"
                }else
                {
                    return "#70BBFF"
                }
            }
        }
//        return .black
        return "#ffffff"
    }
}

class PSLiangModelDto: Codable{
    let name:String?
    init(name:String = "")
    {
        self.name = name
    }
}
class PSLivenoticeModelDto: Codable{
    let notice:String?
    let info:String?
    init(notice:String = "",
         info:String = "")
    {
        self.notice = notice
        self.info = info
    }
}
class PSVipModelDto: Codable{
    let type:Int?
    init(type:Int = 0)
    {
        self.type = type
    }
}
class PSLevelAnchorInfoDto: Codable{
    
    let level: Int?
    let level_name: String?
    let experience_now: Int?
    let experience_up: Int?
    let thumb: String?
    let thumb_mark: String?
    init(level: Int = 0,
         level_name: String = "",
         experience_now: Int = 0,
         experience_up: Int = 0,
         thumb: String = "",
         thumb_mark: String = "") {
        self.level = level
        self.level_name = level_name
        self.experience_now = experience_now
        self.experience_up = experience_up
        self.thumb = thumb
        self.thumb_mark = thumb_mark
    }
    
}
class PSIdentitiesDto: Codable{
    
    let attention:Int?
    let bonus:Int?
    let deposit:Int?
    let identity:Int? // usertype / usertypecolor
    let ban_ip:Int?
    let broadcast_set:Int?
    let forbidden_chat:Int?
    let host_set:Int?
    let host_sign_up:Int?
    let hot_rate:Int?
    let income_in:Int?
    let infinity_chat:Int?
    let luck_money:Int?
    let online_notify:Int?
    let profit_rate:Int?
    let protect_chat:Int?
    let protect_ip:Int?
    let room_manager:Int?
    let room_set:Int?
    let rooms:JSONValue?
    let special_eff:Int?
    let special_frame:Int?
    let upgrade_notify:Int?
    init(
        attention:Int = 0,
        bonus:Int = 0,
        deposit:Int = 0,
        identity:Int = 0,
        ban_ip:Int = 0,
        broadcast_set:Int = 0,
        forbidden_chat:Int = 0,
        host_set:Int = 0,
        host_sign_up:Int = 0,
        hot_rate:Int = -99,
        income_in:Int = 0,
        infinity_chat:Int = 0,
        luck_money:Int = 0,
        online_notify:Int = 0,
        profit_rate:Int = 0,
        protect_chat:Int = 0,
        protect_ip:Int = 0,
        room_manager:Int = 0,
        room_set:Int = 0,
        rooms:JSONValue = JSONValue.int(0),
        special_eff:Int = 0,
        special_frame:Int = 0,
        upgrade_notify:Int = 0
    )
    {
        self.attention = attention
        self.bonus = bonus
        self.deposit = deposit
        self.identity = identity
        self.ban_ip = ban_ip
        self.broadcast_set = broadcast_set
        self.forbidden_chat = forbidden_chat
        self.host_set = host_set
        self.host_sign_up = host_sign_up
        self.hot_rate = hot_rate
        self.income_in = income_in
        self.infinity_chat = infinity_chat
        self.luck_money = luck_money
        self.online_notify = online_notify
        self.profit_rate = profit_rate
        self.protect_chat = protect_chat
        self.protect_ip = protect_ip
        self.room_manager = room_manager
        self.room_set = room_set
        self.rooms = rooms
        self.special_eff = special_eff
        self.special_frame = special_frame
        self.upgrade_notify = upgrade_notify
    }
}

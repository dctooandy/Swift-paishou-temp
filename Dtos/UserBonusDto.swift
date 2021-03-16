//
//  UserBonusDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/25.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class UserBonusDto: Codable {
    let code:Int?
    let msg:String?
    let info:[UserBonusInfoDto]?
    // 0910
    let bonus_switch:Int?
    let list:[NewBonusListDto]?
    var openFullADView:Bool?
    func shouldOpen() -> Int {
        var openFlag : Int
        #if PSPRO
//        openFlag = Int((self.info?.first?.bonus_switch!)!)!
        openFlag = self.bonus_switch!
        #elseif PSSTAGE
        openFlag = self.bonus_switch!
        #elseif PSDEV
        openFlag = self.bonus_switch!
        #else
        #endif
        return openFlag
    }
    init(
        code:Int = 0,
        msg:String = "",
        info:[UserBonusInfoDto] = [UserBonusInfoDto()],
        bonus_switch:Int = 0,
        list:[NewBonusListDto] = [NewBonusListDto()],
        openFullADView : Bool = true
         )
    {
        self.code = code
        self.msg = msg
        self.info = info
        // 0910
        self.bonus_switch = bonus_switch
        self.list = list
        self.openFullADView = openFullADView
    }
}
class UserBonusInfoDto: Codable {
    let bonus_switch:String?        // 每日签到是否开启
    let bonus_day:String?           // 可以签到的星期
    let count_day:String?           // 连续天数
    let bonus_list:[BonusListDto]?    // 可获取 砖石列表
    
    init(bonus_switch:String = "0",
         bonus_day:String = "0",
         count_day:String = "0",
         bonus_list:[BonusListDto] = [BonusListDto()]
    )
    {
        self.bonus_switch = bonus_switch
        self.bonus_day = bonus_day
        self.count_day = count_day
        self.bonus_list = bonus_list
    }
}

class BonusListDto: Codable {
    let day:String?
    let coin:String?

    init(
        day:String = "0",
        coin:String = "0"
    )
    {
        self.day = day
        self.coin = coin
    }
}
class NewBonusListDto: Codable {
    let day:Int?
    let coin:Int?
    let received:Int?

    init(
        day:Int = 0,
        coin:Int = 0,
        received:Int = 0
    )
    {
        self.day = day
        self.coin = coin
        self.received = received
    }
}

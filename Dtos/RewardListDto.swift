//
//  RewardListDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

class RewardListDto: Codable {
    var list:[RewardListDataDto]?
    var total:Int?
    
    init(
        list:[RewardListDataDto] = [RewardListDataDto()],
        total:Int = 0
    )
    {
        self.list = list
        self.total = total
    }
}
class RewardListDataDto:Codable {
    let addtime: Double?
    let giftcount: Int?
    let giftname: String?
    let id: Int?
    let totalcoin: Int?
    let user_nicename: String?
    init(
        addtime:Double = 0.0,
        giftcount:Int = 0,
        giftname:String = "",
        id:Int = 0,
        totalcoin:Int = 0,
        user_nicename:String = ""
    )
    {

        self.addtime = addtime
        self.giftcount = giftcount
        self.giftname = giftname
        self.id = id
        self.totalcoin = totalcoin
        self.user_nicename = user_nicename
    }
}

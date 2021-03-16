//
//  SendbarrageDto.swift
//  PS_Catalina
//
//  Created by AndyChen on 2020/9/22.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class SendbarrageDto: Codable
{
    let barragetoken :String?
    let content :String?
    let giftname :String?
    let gifticon :String?
    let coin :Int?
    let donate_total :Int?
    let giftcount :Int?
    let giftid :Int?
    let level :Int?
    let roomheat :Int?
    let totalcoin :Int?
    let uid :Int?
    let votestotal :Int?
    let gifttoken :String?
    var liveuid:String?
    var stream:String?
    
    init(barragetoken : String = "",
         content : String = "",
         giftname : String = "",
         gifticon : String = "",
         coin : Int = 0,
         donate_total : Int = 0,
         giftcount : Int = 0,
         giftid : Int = 0,
         level : Int = 0,
         roomheat : Int = 0,
         totalcoin : Int = 0,
         uid : Int = 0,
         votestotal : Int = 0,
         gifttoken : String = "",
         liveuid:String = "",
         stream:String = ""
    ) {
        self.barragetoken = barragetoken
        self.content = content
        self.giftname = giftname
        self.gifticon = gifticon
        self.coin = coin
        self.donate_total = donate_total
        self.giftcount = giftcount
        self.giftid = giftid
        self.level = level
        self.roomheat = roomheat
        self.totalcoin = totalcoin
        self.uid = uid
        self.votestotal = votestotal
        
        self.gifttoken = gifttoken
        self.liveuid = liveuid
        self.stream = stream
    }
}

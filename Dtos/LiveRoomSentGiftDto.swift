//
//  LiveRoomSentGiftDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/25.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

class LiveRoomSentGiftDto: Codable{
    
    let gifttoken: String?
    let level: Int?
    let coin: Int?
    // 發送Socket用
    var liveuid: String?
    // publicService
    let code: Int?
    let info: [LiveRoomSentGiftInfoDto]?
    let msg: String?
    init(gifttoken: String = "", level: Int = 0, coin: Int = 0 , liveuid:String = "",
         code : Int = 0,
         info: [LiveRoomSentGiftInfoDto] = [],
         msg :String = "") {
        self.gifttoken = gifttoken
        self.level = level
        self.coin = coin
        self.liveuid = liveuid
        self.code = code
        self.info = info
        self.msg = msg
    }
}
class LiveRoomSentGiftInfoDto: Codable {
    let gifttoken: String?
    let level: String?
    let coin: String?
    init(gifttoken: String = "", level: String = "", coin: String = "" ) {
           self.gifttoken = gifttoken
           self.level = level
           self.coin = coin
       }
}

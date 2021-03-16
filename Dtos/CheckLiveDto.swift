//
//  CheckLiveDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class CheckLiveDto: Codable {
    let code:Int?
    let msg:String?
    let info:[CheckLiveInfoDto]?
    
    init(code:Int = 0,
         msg:String = "",
         info:[CheckLiveInfoDto] = [CheckLiveInfoDto()] )
    {
        self.code = code
        self.msg = msg
        self.info = info
    }
}
class CheckLiveInfoDto: Codable {
    let type : String?
    let type_val : String?
    let type_msg : String?
    let live_sdk : String?
    init(type : String = "",
         type_val : String = "",
         type_msg : String = "",
         live_sdk : String = "" )
    {
        self.type = type
        self.type_val = type_val
        self.type_msg = type_msg
        self.live_sdk = live_sdk
    }
}

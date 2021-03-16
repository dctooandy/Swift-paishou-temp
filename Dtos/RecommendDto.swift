//
//  RecommendDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class RecommendDto: Codable {
    let code:Int?
    let msg:String?
    let info:[RecommendInfoDto]?
    
    init(code:Int = 0,
         msg:String = "",
         info:[RecommendInfoDto] = [RecommendInfoDto()])
    {
        self.code = code
        self.msg = msg
        self.info = info
    }
}
class RecommendInfoDto: Codable {
    let id:String?
    let user_nicename:String?
    let avatar:String?
    let avatar_thumb:String?
    let fans:String?
    let isattention:String?
    
    init(id:String = "",
         user_nicename:String = "",
         avatar:String = "",
         avatar_thumb:String = "",
         fans:String = "",
         isattention:String = ""
         )
    {
        self.id = id
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.fans = fans
        self.isattention = isattention
    }
}

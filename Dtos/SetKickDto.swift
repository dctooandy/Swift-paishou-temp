//
//  SetKickDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/19.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class SetKickDto: Codable{
    let isadmin: Int?
    var toname:String?
    var touid:String?
    
    init(isadmin: Int = 0,
         toname:String = "",
         touid:String = ""
    )
    {
        self.isadmin = isadmin
        self.toname = toname
        self.touid = touid
    }
}


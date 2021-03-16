//
//  SetAdminDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/10/14.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
//設定房間管理員
class SetAdminDto: Codable {
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

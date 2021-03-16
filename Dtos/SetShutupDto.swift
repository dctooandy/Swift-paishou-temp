//
//  SetShutupDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/19.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class SetShutupDto: Codable{
    let status: Bool?
    var toname:String?
    var touid:String?
    init(isattent: Bool = true,
         toname:String = "",
         touid:String = "") {
        self.status = isattent
        self.toname = toname
        self.touid = touid
    }
 
}

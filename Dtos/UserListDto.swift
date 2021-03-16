//
//  UserListDto.swift
//  PS_Catalina
//
//  Created by AndyChen on 2020/10/19.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class UserListDto: Codable{
    var uidString: String?
    var adminRoomsString: String?
    init(uidString: String = "",
         adminRoomsString:String = "")
    {
        self.uidString = uidString
        self.adminRoomsString = adminRoomsString
    }
}

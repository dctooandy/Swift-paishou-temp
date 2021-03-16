//
//  UserInboxListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/15.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class UserInboxListDto: Codable{
    
    let total: Int?
    let list: [UserInboxListItemDto]?
    
    init(total: Int = 0, list: [UserInboxListItemDto] = [UserInboxListItemDto()]) {
        self.total = total
        self.list = list
    }
}

class UserInboxListItemDto: Codable{
    
    let id: Int?
    let title: String?
    let content: String?
    let create_at: String?
    let status: Int?
    
    init(id: Int = 0, title: String = "", content: String = "", create_at: String = "", status: Int = 0) {
        self.id = id
        self.title = title
        self.content = content
        self.create_at = create_at
        self.status = status
    }
}
class UserInboxDeleteDto: Codable{
    
    let status: Bool?
    
    init(status: Bool = false) {
        self.status = status
    }
    
}

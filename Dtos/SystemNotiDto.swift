//
//  SystemNotiDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/20.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class SystemNotificationDto: Codable{
    let total: Int?
    let list: [SystemNotificationListItemsDto]?
    let category: [SystemNotificationCategoryItemsDto]?
    
    init(total: Int = 0,
         list: [SystemNotificationListItemsDto] = [SystemNotificationListItemsDto()],
         category: [SystemNotificationCategoryItemsDto] = [SystemNotificationCategoryItemsDto()])  {
        self.total = total
        self.list = list
        self.category = category
    }
}

class SystemNotificationListItemsDto: Codable{
    let id: Int?
    let name: String?
    let title: String?
    let content: String?
    let create_at: Int?
    init(id: Int = 0,
         name: String = "",
         title: String = "",
         content: String = "",
         create_at: Int = 0) {
        self.id = id
        self.name = name
        self.title = title
        self.content = content
        self.create_at = create_at
    }
}

class SystemNotificationCategoryItemsDto: Codable{
    
    let id: Int?
    let name: String?
    init(id: Int = 0,
         name: String = "") {
        self.id = id
        self.name = name
    }
}

class SystemNotificationDetailDto: Codable{
    let id: Int?
    let type_name: String?
    let title: String?
    let content: String?
    let url: String?
    let create_at : Int?
    init(id: Int = 0,
         type_name: String = "",
         title: String = "",
         content: String = "",
         create_at: Int = 0,
         url: String = "") {
        self.id = id
        self.type_name = type_name
        self.title = title
        self.content = content
        self.url = url
        self.create_at = create_at
    }
}

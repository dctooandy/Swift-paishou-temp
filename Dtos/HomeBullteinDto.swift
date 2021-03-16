//
//  HomeBullteinDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/30.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class HomeBullteinDto: Codable{
    let list: [HomeBullteinItemDto]?
    init(list: [HomeBullteinItemDto] = [HomeBullteinItemDto()]) {
        self.list = list
    }
}
class HomeBullteinItemDto: Codable{
    let content: String?
    let title : String?
    let id :Int?
    init(content: String = "",id:Int = 0,title:String = "") {
        self.content = content
        self.title = title
        self.id = id
    }
}

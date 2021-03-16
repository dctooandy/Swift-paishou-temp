//
//  HomeEventDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2021/1/8.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import Foundation
class HomeEventCategoryDto: Codable{
    
    let top: HomeEventItemDto?
    let list: [HomeEventCategoryListDto]?
    init(top: HomeEventItemDto = HomeEventItemDto(), list: [HomeEventCategoryListDto] = [HomeEventCategoryListDto()]) {
        self.top = top
        self.list = list
    }
    
}
class HomeEventListDto: Codable{

    let list: [HomeEventItemDto]?
    init(list: [HomeEventItemDto] = [HomeEventItemDto()]) {
        self.list = list
    }
}
class HomeEventItemDto: Codable{
    let event_name: String?
    let event_pic: String?
    let event_url: String?
    let event_status: String?
    let start_at: String?
    let end_at: String?
    let event_web_url: String?
    init(event_name: String = "",
         event_pic: String = "",
         event_url: String = "",
         event_status: String = "",
         start_at: String = "",
         end_at: String = "",
         event_web_url: String = "") {
        self.event_name = event_name
        self.event_pic = event_pic
        self.event_url = event_url
        self.event_status = event_status
        self.start_at = start_at
        self.end_at = end_at
        self.event_web_url = event_web_url
    }
}
class HomeEventCategoryListDto: Codable{
    let id: JSONValue?
    let title: String?
    init(id: JSONValue = JSONValue.int(0),
         title: String = "") {
        self.id = id
        self.title = title
    }
}

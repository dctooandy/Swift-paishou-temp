//
//  HomeEventHotDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class HomeEventHotDto: Codable{
    let list: [HomeEventHotItemDto]?
    init(list: [HomeEventHotItemDto] = [HomeEventHotItemDto()]) {
        self.list = list
    }
}
class HomeEventHotItemDto: Codable{
    let id: JSONValue?
    let uid: JSONValue?
    let nickname: String?
    let cn: String?
    let home: String?
    let away: String?
    let begin1: String?
    let hlog: String?
    let alog: String?
    //0115
    let liveclassid:JSONValue?
    init(id: JSONValue = JSONValue.int(0),
         uid: JSONValue = JSONValue.int(0),
         nickname: String = "",
         cn: String = "",
         home: String = "",
         away: String = "",
         begin1: String = "",
         hlog: String = "",
         alog: String = "",
         liveclassid:JSONValue = JSONValue.int(0)) {
        self.id = id
        self.uid = uid
        self.nickname = nickname
        self.cn = cn
        self.home = home
        self.away = away
        self.begin1 = begin1
        self.hlog = hlog
        self.alog = alog
        self.liveclassid = liveclassid
    }
}

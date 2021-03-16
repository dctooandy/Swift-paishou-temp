//
//  LiveCheckDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2021/1/6.
//  Copyright © 2021 Andy Chen. All rights reserved.
//

import Foundation
class LiveCheckDto: Codable{
    let stream:String?
    let title:String?
    let liveclassid:JSONValue?
    let type:JSONValue?
    let starttime:String?
    let push:String?
    let notice:String?
    let score_id:JSONValue?
    let cn:String?
    let begin1:String?
    let home:String?
    let away:String?
    
    init(stream:String = "",
         title:String = "",
         liveclassid:JSONValue = JSONValue.int(0),
         type:JSONValue = JSONValue.int(0),
         starttime:String = "",
         push:String = "",
         notice:String = "",
         score_id:JSONValue = JSONValue.int(0),
         cn:String = "",
         begin1:String = "",
         home:String = "",
         away:String = ""
    ) {
        self.stream = stream
        self.title = title
        self.liveclassid = liveclassid
        self.type = type
        self.starttime = starttime
        self.push = push
        self.notice = notice
        self.score_id = score_id
        self.cn = cn
        self.begin1 = begin1
        self.home = home
        self.away = away
    }
}

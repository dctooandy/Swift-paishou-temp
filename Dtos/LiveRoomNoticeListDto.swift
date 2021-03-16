//
//  LiveRoomNoticeListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/18.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class LiveRoomNoticeListDto: Codable{
    
    let list: [LiveRoomNoticeItemDto]?
    
    init(list: [LiveRoomNoticeItemDto] = [LiveRoomNoticeItemDto()]) {
        self.list = list
    }
}

class LiveRoomNoticeListItemDto: Codable{
    let notice: String? //通知标题公告
    let info: String? //通知内容介绍
    
    init(notice: String = "", info: String = "") {
        self.notice = notice
        self.info = info
    }
}

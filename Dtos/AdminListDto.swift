//
//  AdminListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/8.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

//房間管理員列表
class AdminListDto: Codable {
    let total: Int?
    let list: [AdminListItemsDto]?
    
    init(total: Int = 0,
         list: [AdminListItemsDto] = [AdminListItemsDto()]) {
        self.total = total
        self.list = list
    }
}

class AdminListItemsDto: Codable{
    
    let uid: Int? //房間ＩＤ，就是直播主ＵＩＤ
    let name: String? //顯示主播暱稱
    let latest_live: String? //顯示最後一次主播開播時間
    let latest_login: String? //該房管最後一次進入直播間時間
    let status: Int? //主播開播狀態，開播中/關閉
    
    init(uid: Int = 0,
         name: String = "",
         latest_live: String = "",
         latest_login: String = "",
         status: Int = 0) {
        self.uid = uid
        self.name = name
        self.latest_live = latest_live
        self.latest_login = latest_login
        self.status = status
    }
}

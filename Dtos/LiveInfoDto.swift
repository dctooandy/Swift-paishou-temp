//
//  LiveInfoDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/15.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
//直播間資訊dto
class LiveInfoDto: Codable{
    
    let fans: Int? //粉絲數
    let isattent: Int? //0: 未關注, 1: 已關注
    let livenotice: LiveInfoNoticeDto?
    let zillionaire_rank: Int? //主播富豪排行名次
    let star_rank: Int? //主播明星排行名次
    
    init(fans: Int = 0,
         isattent: Int = 0,
         livenotice: LiveInfoNoticeDto = LiveInfoNoticeDto(),
         zillionaire_rank: Int = 0,
         star_rank: Int = 0) {
        self.fans = fans
        self.isattent = isattent
        self.livenotice = livenotice
        self.zillionaire_rank = zillionaire_rank
        self.star_rank = star_rank
    }
}
class LiveInfoNoticeDto: Codable{
    
    let notice: String? //通知标题公告
    let info: String? //通知内容介绍
    
    init(notice: String = "", info: String = "") {
        self.notice = notice
        self.info = info
    }
}

//
//  LiveRoomRedListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/9/16.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class LiveRoomRedListDto: Codable{
    
    let list: [LiveRoomRedItemsDto]?
    
    init(list: [LiveRoomRedItemsDto] = [LiveRoomRedItemsDto()]) {
        self.list = list
    }
    
}
class LiveRoomRedItemsDto: Codable{
    
    let id: Int?//红包ID
    let showid: Int?//直播标识
    let uid: Int?//用户ID
    let liveuid: Int?//主播ID
    let type: Int?//红包类型 0固定，1随机
    let type_grant: Int?//发放类型 0立即，1延迟
    let coin: Int?//蕉币数
    let nums: Int?//红包数量
    let des: String?//红包描述
    let effecttime: Int?//生效时间
    let addtime: Int?//添加时间
    let status: Int?//状态 0抢中，1抢完
    let coin_rob: Int?//钻石数
    let nums_rob: Int?//数量
    let avatar: String?//头像
    let avatar_thumb: String?//头像缩略
    let user_nicename: String?//昵称
    let isrob: Int?//是否能抢 0可以抢 1 不能抢
    let second: Int?//剩余秒数
    
    init(id: Int = 0,
         showid: Int = 0,
         uid: Int = 0,
         liveuid: Int = 0,
         type: Int = 0,
         type_grant: Int = 0,
         coin: Int = 0,
         nums: Int = 0,
         des: String = "",
         effecttime: Int = 0,
         addtime: Int = 0,
         status: Int = 0,
         coin_rob: Int = 0,
         nums_rob: Int = 0,
         avatar: String = "",
         avatar_thumb: String = "",
         user_nicename: String = "",
         isrob: Int = 0,
         second: Int = 0) {
        self.id = id
        self.showid = showid
        self.uid = uid
        self.liveuid = liveuid
        self.type = type
        self.type_grant = type_grant
        self.coin = coin
        self.nums = nums
        self.des = des
        self.effecttime = effecttime
        self.addtime = addtime
        self.status = status
        self.coin_rob = coin_rob
        self.nums_rob = nums_rob
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.user_nicename = user_nicename
        self.isrob = isrob
        self.second = second
    }
    
}

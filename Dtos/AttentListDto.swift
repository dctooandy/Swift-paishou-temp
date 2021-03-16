//
//  AttentListDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/3.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class AttentListDto: Codable {
    let list :[AttentListDataDto]?
    let total :Int?
    init(list:[AttentListDataDto] = [AttentListDataDto()],
         total:Int = 0)
    {
        self.list = list
        self.total = total
    }
}
class AttentListDataDto:Codable
{
    let liang : AttentLiangDto?
    let vip :AttentVipDto?
    let avatar :String?
    let birthday :String?
    let city :String?
    let create_time :String?
    let goodnum :String?
    let last_login_ip :String?
    let last_login_time :String?
    let login_type :String?
    let mobile :String?
    let openid :String?
    let province :String?
    let qqgroup :String?
    let sign :String?
    let signature :String?
    let source :String?
    let token :String?
    let user_activation_key :String?
    let user_email :String?
    let user_login :String?
    let user_nicename :String?
    let user_url :String?
    let sex :String?
    let cashbacktime :Int?
    let fans_num :Int?
    let coin :Int?
    let consumption :Int?
    let expiretime :Int?
    let id :Int?
    let ishot :Int?
    let isrecommend :Int?
    let isrecord :Int?
    let issuper :Int?
    let iszombie :Int?
    let iszombiep :Int?
    let level :Int?
    let level_anchor :Int?
    let lotterysum :Int?
    let lotterytime :Int?
    let score :Int?
    let user_status :Int?
    let user_type :Int?
    let usertype :Int?
    let votes :Int?
    let votestotal :Int?
    var customIsLive:Bool?
    init(
        liang :AttentLiangDto = AttentLiangDto(),
        vip :AttentVipDto = AttentVipDto(),
        avatar : String = "",
        birthday : String = "",
        city : String = "",
        create_time : String = "",
        goodnum : String = "",
        last_login_ip : String = "",
        last_login_time : String = "",
        login_type : String = "",
        mobile : String = "",
        openid : String = "",
        province : String = "",
        qqgroup : String = "",
        sign : String = "",
        signature : String = "",
        source : String = "",
        token : String = "",
        user_activation_key : String = "",
        user_email : String = "",
        user_login : String = "",
        user_nicename : String = "",
        user_url : String = "",
        sex :String = "",
        cashbacktime :Int = 0,
        fans_num :Int = 0,
        coin :Int = 0,
        consumption :Int = 0,
        expiretime :Int = 0,
        id :Int = 0,
        ishot :Int = 0,
        isrecommend :Int = 0,
        isrecord :Int = 0,
        issuper :Int = 0,
        iszombie :Int = 0,
        iszombiep :Int = 0,
        level :Int = 0,
        level_anchor :Int = 0,
        lotterysum :Int = 0,
        lotterytime :Int = 0,
        score :Int = 0,
        user_status :Int = 0,
        user_type :Int = 0,
        usertype :Int = 0,
        votes :Int = 0,
        votestotal :Int = 0,
        customIsLive : Bool = true

    )
    {
        self.liang = liang
        self.vip = vip
        self.avatar = avatar
        self.birthday = birthday
        self.city = city
        self.create_time = create_time
        self.goodnum = goodnum
        self.last_login_ip = last_login_ip
        self.last_login_time = last_login_time
        self.login_type = login_type
        self.mobile = mobile
        self.openid = openid
        self.province = province
        self.qqgroup = qqgroup
        self.sign = sign
        self.signature = signature
        self.source = source
        self.token = token
        self.user_activation_key = user_activation_key
        self.user_email = user_email
        self.user_login = user_login
        self.user_nicename = user_nicename
        self.user_url = user_url
        self.sex = sex
        self.cashbacktime = cashbacktime
        self.fans_num = fans_num
        self.coin = coin
        self.consumption = consumption
        self.expiretime = expiretime
        self.id = id
        self.ishot = ishot
        self.isrecommend = isrecommend
        self.isrecord = isrecord
        self.issuper = issuper
        self.iszombie = iszombie
        self.iszombiep = iszombiep
        self.level = level
        self.level_anchor = level_anchor
        self.lotterysum = lotterysum
        self.lotterytime = lotterytime
        self.score = score
        self.user_status = user_status
        self.user_type = user_type
        self.usertype = usertype
        self.votes = votes
        self.votestotal = votestotal
        self.customIsLive = customIsLive
    }
}
class AttentLiangDto: Codable{
    let name:String?
    init(name:String = "")
    {
        self.name = name
    }
}
class AttentVipDto: Codable{
    let type:Int?
    init(type:Int = 0)
    {
        self.type = type
    }
}

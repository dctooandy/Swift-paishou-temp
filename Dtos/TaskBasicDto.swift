//
//  TaskBasicDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/27.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
//新手任務
class TaskBasicDto: Codable{
    let list: [TaskBasicListDto]?
    init(list: [TaskBasicListDto] = [TaskBasicListDto()]) {
        self.list = list
    }
}
class TaskBasicListDto: Codable{
    
    let id: Int? //任務id
    let name: String? //任務名稱
    let success_count: Int? //完成次數
    let need_finish_count: Int? //須達成次數
    let bonus_type: JSONValue? //獎勵類型
    let bonus_type_name: String? //獎勵類型
    let quantity: Int? //獎勵數量
    let status: Int? //狀態 0:未完成 1:可領取 2:已領取
    let status_name: String? //狀態名稱
    let link: String? //任務區塊
    
    init(id: Int = 0,
         name: String = "",
         success_count: Int = 0,
         need_finish_count: Int = 0,
         bonus_type: JSONValue = JSONValue.int(0),
         bonus_type_name: String = "",
         quantity: Int = 0,
         status: Int = 0,
         status_name: String = "",
         link: String = ""
    ) {
        self.id = id
        self.name = name
        self.success_count = success_count
        self.need_finish_count = need_finish_count
        self.bonus_type = bonus_type
        self.bonus_type_name = bonus_type_name
        self.quantity = quantity
        self.status = status
        self.status_name = status_name
        self.link = link
    }
    
}
class BasicTaskCompletedDto: Codable{
    let status: Bool?
    init(status: Bool = false) {
        self.status = status
    }
}
class SignSuccessGetBonusDto: Codable{
    
    let code: Int?
    let message: String?
    let data: SignSuccessDataDto?
    init(code: Int = 0, msg: String = "", data: SignSuccessDataDto = SignSuccessDataDto()) {
        self.code = code
        self.message = msg
        self.data = data
    }
    
}
class SignSuccessDataDto: Codable{
    let coin: JSONValue?
    let unit: String?
    init(coin: JSONValue = JSONValue.int(0), unit: String = "") {
        self.coin = coin
        self.unit = unit
    }
}

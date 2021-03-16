//
//  TaskPaymentDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/30.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
class TaskPaymentDto: Codable{
    let list: [TaskPaymentListDto]?
    init(list: [TaskPaymentListDto] = [TaskPaymentListDto()]) {
        self.list = list
    }
}
class TaskPaymentListDto: Codable{
    
    let task_list_id: Int? //任務id
    let name: String? //任務名稱
    let success_count: Int? //完成次數
    let need_finish_count: Int? //須達成次數
    let bonus_type: JSONValue? //獎勵類型
    let bonus_type_name: String? //獎勵類型
    let quantity: Int? //獎勵數量
    let status: Int? //狀態 0:未完成 1:可領取 2:已領取
    let status_name: String? //狀態名稱
    let link: String? //任務區塊
    let Uid:String?
    let Action: String?
    let ReceivedAt: String?
   
    init(task_list_id: Int = 0,
         name: String = "",
         success_count: Int = 0,
         need_finish_count: Int = 0,
         bonus_type: JSONValue = JSONValue.int(0),
         bonus_type_name: String = "",
         quantity: Int = 0,
         status: Int = 0,
         status_name: String = "",
         link: String = "",
         Uid:String = "",
         Action: String = "",
         ReceivedAt: String = ""
    ) {
        self.task_list_id = task_list_id
        self.name = name
        self.success_count = success_count
        self.need_finish_count = need_finish_count
        self.bonus_type = bonus_type
        self.bonus_type_name = bonus_type_name
        self.quantity = quantity
        self.status = status
        self.status_name = status_name
        self.link = link
        self.Uid = Uid
        self.Action = Action
        self.ReceivedAt = ReceivedAt
    }
}
class PaymentTaskCompletedDto: Codable{
    let success: JSONValue?
    init(success: JSONValue = JSONValue.bool(false)) {
        self.success = success
    }
}

//
//  TaskLimitDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
import RxSwift
class TaskLimitDto: Codable{
    static var share:TaskLimitDto?
    {
        didSet {
            guard let share = share else { return }
            subject.onNext(share)
        }
    }
    static var rxShare:Observable<TaskLimitDto?> = subject
        .do(onNext: { value in
            if share == nil {
                _ = update()
            }
        })
    static let disposeBag = DisposeBag()
    static private let subject = BehaviorSubject<TaskLimitDto?>(value: nil)
    static func update() -> Observable<()>{
        let subject = PublishSubject<Void>()
        Beans.userServer.fetchTaskLimitList().subscribeSuccess { (dto) in
            Log.v("Fetch GiftList")
            guard let data = dto else {return}
            share = data
            subject.onNext(())
        }.disposed(by: disposeBag)
        return subject.asObservable()
    }
    
    
    let list: [TaskLimitListDto]?
    init(list: [TaskLimitListDto] = [TaskLimitListDto()]) {
        self.list = list
    }
}
class TaskLimitListDto: Codable{
    
    let name: String? //任務名稱
    let quantity: Int? //獎勵數量
    let status: Int? //狀態 0:未完成 1:領取 2:已領取 3:已過期
    // 1126
    let id:JSONValue?
    let period_id:JSONValue?
    let explanation: String?
    let today: String?
    let icon: String?
    let start_time: String?
    let end_time: String?
    let gift_list: [LimitTaskGiftListDto]?
    // 原本的
    let task_list_id: Int? //任務id
    let success_count: Int? //完成次數
    let need_finish_count: Int? //須達成次數
    let bonus_type: JSONValue? //獎勵類型
    let bonus_type_name: String? //獎勵類型
    let status_name: String? //狀態名稱
    let link: String? //任務區塊
    let Uid:String?
    let Action: String?
    let ReceivedAt: String?
    func statusName() -> String
    {
        switch status {
        case 0:
            return "未完成"
        case 1:
            return "领取"
        case 2:
            return "已领取"
        case 3:
            return "已过期"
        default:
            return "已过期"
        }
    }
    func mapTime() -> (sTime: String, eTime:String)
    {
        let calendar = Calendar.current
        let calendarSet: Set<Calendar.Component> = [
            Calendar.Component.year]
        let dateComponents = calendar.dateComponents(calendarSet, from: Date())
        if let yearString = dateComponents.year,
            let todayString = today,
            let startString = start_time,
            let endString = end_time
        {
            return (sTime: "\(yearString)/\(todayString) \(startString)", eTime:"\(yearString)/\(todayString) \(endString)")
        }
        else{
            return (sTime: "noData", eTime:"noData")
        }
    }
    func cacuHeight() -> CGFloat
    {
        var finalTupleArray:[(text: String, textColor: UIColor)] = []
        let label = UILabel()
        if let giftList = gift_list
        {
            for giftData in giftList {
                if let giftName = giftData.giftname,
                    let quantity = giftData.quantity?.intValue
                {
                    finalTupleArray.append((text: giftName, textColor: .white))
                    finalTupleArray.append((text: " + \(quantity)个", textColor: Themes.psTextColorliveRoomGordan))
                }
                if giftList.count != (giftList.indexOfObject(object: giftData) + 1)
                {
                    finalTupleArray.append((text: "、", textColor: .white))
                }
            }
        }
        label.setAttributeStrWithTuple(tupleArray: finalTupleArray)
        if let lebelString = label.text
        {
            let stringHeight = lebelString.calculateMaxHeight(lableWidth: Views.screenWidth - pWidth(164) - pWidth(6) , fontSize: 12).height
            if stringHeight <= pWidth(17.5)
            {
                return pWidth(123.5)
            }else
            {
                return  stringHeight + pWidth(106)
            }
        }else
        {
            return pWidth(123.5)
        }
    }
    init(
        name: String = "",
        quantity: Int = 0,
        status: Int = 0,
        id:JSONValue = JSONValue.int(0),
        period_id:JSONValue = JSONValue.int(0),
        explanation: String = "",
        today: String = "",
        icon: String = "",
        start_time: String = "",
        end_time: String = "",
        gift_list: [LimitTaskGiftListDto] = [LimitTaskGiftListDto()],
        
        task_list_id: Int = 0,
        success_count: Int = 0,
        need_finish_count: Int = 0,
        bonus_type: JSONValue = JSONValue.int(0),
        bonus_type_name: String = "",
        status_name: String = "",
        link: String = "",
        Uid:String = "",
        Action: String = "",
        ReceivedAt: String = ""
    ) {
        self.name = name
        self.quantity = quantity
        self.status = status
        self.id = id
        self.period_id = period_id
        self.explanation = explanation
        self.today = today
        self.icon = icon
        self.start_time = start_time
        self.end_time = end_time
        self.gift_list = gift_list
        self.task_list_id = task_list_id
        self.success_count = success_count
        self.need_finish_count = need_finish_count
        self.bonus_type = bonus_type
        self.bonus_type_name = bonus_type_name
        self.status_name = status_name
        self.link = link
        self.Uid = Uid
        self.Action = Action
        self.ReceivedAt = ReceivedAt
    }
}
class LimitTaskCompletedDto: Codable{
    let is_received: Int?
    init(is_received: Int = 0) {
        self.is_received = is_received
    }
}
class LimitTaskGiftListDto: Codable{
    let gifticon: String?
    let giftname: String?
    let quantity: JSONValue?
    init(gifticon: String = "",
         giftname: String = "",
         quantity: JSONValue = JSONValue.int(0)) {
        self.gifticon = gifticon
        self.giftname = giftname
        self.quantity = quantity
    }
    func realGiftname() -> String?
    {
        if let realName = giftname
        {
            if realName == "bcoin"
            {
                return "蕉幣".LocalizedString
            }else
            {
                return realName
            }
        }else
        {
            return ""
        }
    }
   
}

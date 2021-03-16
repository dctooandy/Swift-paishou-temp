//
//  LiveRoomAppointmentListDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/11/26.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class LiveRoomAppointmentListDto: Codable{
    
    let total: JSONValue?
    let list: [LiveRoomAppointmentListItemDto]?
    init(total: JSONValue = JSONValue.int(0),
         list: [LiveRoomAppointmentListItemDto] = [LiveRoomAppointmentListItemDto()]) {
        self.total = total
        self.list = list
    }
    
}
class LiveRoomAppointmentListItemDto: Codable{
    
    let id: JSONValue?
    let cn: String?//賽事名稱
    let home: String?//主隊名稱
    let away: String?//客隊名稱
    let hlog: String?//主隊logo
    let alog: String?//客隊logo
    let begin_date: String?
    let begin_time: String?
    var is_appointment: JSONValue?
    
    init(id: JSONValue = JSONValue.int(0),
         cn: String = "",
         home: String = "",
         away: String = "",
         hlog: String = "",
         alog: String = "",
         begin_date: String = "",
         begin_time: String = "",
         is_appointment: JSONValue = JSONValue.bool(false)
         
    ) {
        self.id = id
        self.cn = cn
        self.home = home
        self.away = away
        self.hlog = hlog
        self.alog = alog
        self.begin_date = begin_date
        self.begin_time = begin_time
        self.is_appointment = is_appointment
    }
    static func appointmentUPData(lhs: LiveRoomAppointmentListItemDto, rhs: LiveRoomAppointmentListItemDto) -> Bool {
        let lt = ((lhs.begin_date ?? "") + (lhs.begin_time ?? ""))
        let rt = ((rhs.begin_date ?? "") + (rhs.begin_time ?? ""))
        return lt < rt
    }
}

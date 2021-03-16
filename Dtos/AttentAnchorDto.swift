//
//  AttentAnchorDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/15.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class AttentAnchorDto: Codable{
    let isattent: Int?
    var liveUID : String?
    var liveName : String?
    init(isattent: Int = 0 , liveUID:String = "",liveName:String = "") {
        self.isattent = isattent
        self.liveUID = liveUID
        self.liveName = liveName
    }
}

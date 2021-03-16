//
//  SetBlackDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/10/19.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class setBlackDto: Codable{
    let isblack: Int?
    init(isattent: Int = 0) {
        self.isblack = isattent
    }
}

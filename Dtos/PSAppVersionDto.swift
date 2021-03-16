//
//  PSAppVersionDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/16.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
class PSAppVersionDto: Codable {
    static var didFetch: Bool = false
    static var share: PSAppVersionDto? = nil
    
    let recommend: Int?//0不用更新 1有新版 2強制更新
    let version: String?
    let link: String?
    let message: String?
    
    init(recommend : Int = 0,// 0不用更新 1弱更新 2強更新
         version :String = "1.0.0",
         link :String = "https://www.google.com.tw",
         message :String = "親,有新版要不要更新啊"
         ) {
        self.recommend = recommend
        self.version = version
        self.link = link
        self.message = message
    }
    static func == (lhs: PSAppVersionDto, rhs: PSAppVersionDto) -> Bool {
        return lhs.version == rhs.version
    }
}


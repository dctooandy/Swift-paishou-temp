//
//  VerficationsDto.swift
//  PS_Catalina
//
//  Created by 張宏宇 on 2020/12/17.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

class VerficationMobileDto: Codable{
    let success: JSONValue?
    init(success: JSONValue = JSONValue.bool(false)) {
        self.success = success
    }
}
class VerficationMobileSmsDto: Codable{
    let success: JSONValue?
    init(success: JSONValue = JSONValue.bool(false)) {
        self.success = success
    }
}
class VerficationMobileBindDto: Codable{
    let success: JSONValue?
    init(success: JSONValue = JSONValue.bool(false)) {
        self.success = success
    }
}
class VerficationEmailBindDto: Codable{
    let success: JSONValue?
    init(success: JSONValue = JSONValue.bool(false)) {
        self.success = success
    }
}
class VerficationEmailSmsDto: Codable{
    let success: JSONValue?
    let code: String?
    init(success: JSONValue = JSONValue.bool(false), code: String = "") {
        self.success = success
        self.code = code
    }
}

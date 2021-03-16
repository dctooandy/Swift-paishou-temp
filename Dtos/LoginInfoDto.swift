//
//  LoginInfoDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/24.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class LoginInfoDto: Codable {
    
    let id:String?
    let user_nicename:String?
    let avatar:String?
    let avatar_thumb:String?
    let sex:String?
    let signature:String?
    let coin:String?
    let consumption:String?
    let votestotal:String?
    let province:String?
    let city:String?
    let birthday:String?
    let login_type:String?
    let last_login_time:String?
    let isreg:String?
    let isagent:String?
    let level:String?
    let level_anchor:String?
    let token:String?
    
    init(id:String = "",
         user_nicename:String = "",
         avatar:String = "",
         avatar_thumb:String = "",
         sex:String = "",
         signature:String = "",
         coin:String = "",
         consumption:String = "",
         votestotal:String = "",
         province:String = "",
         city:String = "",
         birthday:String = "",
         login_type:String = "",
         last_login_time:String = "",
         isreg:String = "",
         isagent:String = "",
         level:String = "",
         level_anchor:String = "",
         token:String = "")
    {
        self.id = id
        self.user_nicename = user_nicename
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
        self.sex = sex
        self.signature = signature
        self.coin = coin
        self.consumption = consumption
        self.votestotal = votestotal
        self.province = province
        self.city = city
        self.birthday = birthday
        self.login_type = login_type
        self.last_login_time = last_login_time
        self.isreg = isreg
        self.isagent = isagent
        self.level = level
        self.level_anchor = level_anchor
        self.token = token
    }
    var toJsonString: String {
          do {
              let jsonData = try self.jsonData()
              //            let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
              //                  guard let dictionary = json as? [String : Any] else {
              //                    return [:]
              //                  }
              //            return dictionary as Dictionary
              // Use dictionary
              
              guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                  return ""
              }
              return jsonString
              //                  // Print jsonString
              //                  print(jsonString)
          } catch  {
              
          }
          return ""
      }
}

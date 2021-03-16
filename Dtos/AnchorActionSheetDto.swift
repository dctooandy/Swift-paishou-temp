//
//  AnchorActionSheetDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/11/6.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class AnchorActionSheetDto:Codable {
    
    let id : JSONValue?
    let name : String?
    let nums : Int?
    let thumb : String?
    let des : String?
    let orderno : String?
    let vcStr : String?
    var categorieInt : Int?
    var cellImageType : Int?
    
    init(id:JSONValue = JSONValue.string(""),
         name:String = "",
         nums:Int = 0,
         thumb:String = "",
         des:String = "",
         orderno:String = "",
         vcStr:String = "",
         categorieInt:Int = 0,
         cellImageType:Int = 0)
    {
        self.id = id
        self.name = name
        self.nums = nums
        self.thumb = thumb
        self.des = des
        self.orderno = orderno
        self.vcStr = vcStr
        self.categorieInt = categorieInt
        self.cellImageType = cellImageType
    }
}

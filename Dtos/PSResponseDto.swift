//
//  PSResponseDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/8/21.
//  Copyright © 2020 Andy Chen. All rights reserved.
//


import Foundation
class PSResponseDto<T:Codable>:Codable
{
    let ret:Int?
    let msg:String?
    let data :T?
    init(ret:Int = 0,
         msg:String = "",
         status : Int = 0,
         code:Int = 0 ,
         message:String = "" ,
         ttl:Int = 0 ,
         data : T
    ){
        self.ret = ret
        self.msg = msg
        self.status = status
        self.code = code
        self.message = message
        self.ttl = ttl
        self.data = data
    }
    
    let status:Int?
    let code : Int?
    let message:String?
    let ttl : Int?
    
    var errorMSG :String {
        return "\(msg ?? message ?? "")(\(ret ?? code ?? 0))"
    }
}



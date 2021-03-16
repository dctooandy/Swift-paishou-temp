//
//  ChatRecordDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/12/3.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation

class ChatRecordDto: Codable{
    let end: JSONValue?
    var message : [JSONValue]?
    init(end: JSONValue = JSONValue.int(0) ,
         message:[JSONValue] = [JSONValue.string("")]) {
        self.end = end
        self.message = message
    }
    var msgDic: [BroadCastingListenDto]? {
        if let msgData = message,
           msgData.count > 0
        {
            var msgArray : [BroadCastingListenDto] = []
            for data:JSONValue in msgData {
                if data.stringValue != nil {
                    let str = data.stringValue!.data(using: .utf8)!
                    let decoder = JSONDecoder()
                    do {
                        if let jsondic = try JSONSerialization.jsonObject(with: str, options : .allowFragments) as? Dictionary<String,Any>
                        {
                            print(jsondic)
                            if let data = try? JSONSerialization.data(withJSONObject: jsondic as Any, options: [])
                            {
                                let results = try decoder.decode(BroadCastingListenDto.self, from:data)
                                msgArray.append(results)
                                
                            }else
                            {
                                
                            }
                        }
                    } catch DecodingError.dataCorrupted( _) {
                        Log.e("dataCorrupted")
                    } catch DecodingError.keyNotFound( _,  _) {
                        Log.e("keyNotFound")
                    } catch DecodingError.typeMismatch( _,  _) {
                        Log.e("typeMismatch")
                    } catch DecodingError.valueNotFound( _,  _) {
                        Log.e("valueNotFound")
                    } catch {
                        Log.e(error.localizedDescription)
                    }
                }else
                {
                    
                }
            }
            return msgArray
            
        }else
        {
            return []
        }
    }
}
class ChatRecordMessageDto: Codable{
    let level: JSONValue?
    var name : String?
    let user_type: JSONValue?
    var content : String?
    init(level: JSONValue = JSONValue.int(0) ,
         name:String = "",
         user_type: JSONValue = JSONValue.int(0) ,
         content:String = "")
    {
        self.level = level
        self.name = name
        self.user_type = user_type
        self.content = content
    }
}

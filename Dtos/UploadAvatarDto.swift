//
//  UploadAvatarDto.swift
//  PS_Catalina
//
//  Created by Andy Chen on 2020/9/9.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class UploadAvatarDto: Codable {
    let avatar:String?
    let avatar_thumb:String?
    
    init(
        avatar:String = "0",
        avatar_thumb:String = "0"
    )
    {
        self.avatar = avatar
        self.avatar_thumb = avatar_thumb
    }
}

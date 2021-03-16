//
//  DateGameDto.swift
//  PS_Catalina
//
//  Created by AndyChen on 2020/9/18.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
class DateGameDto: Codable {
    let dateString : String?
    let gameData : SearchGameListDto?
    
    init(dateString : String = "",
         gameData : SearchGameListDto = SearchGameListDto() )
    {
        self.dateString = dateString
        self.gameData = gameData
    }
}

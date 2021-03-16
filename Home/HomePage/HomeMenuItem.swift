//
//  MenuItem.swift
//  PS_Catalina
//
//  Created by Alpha on 2020/8/24.
//  Copyright © 2020 Andy Chen. All rights reserved.
//

import Foundation
import Parchment

struct HomeMenuItem: PagingItem, Hashable, Comparable {
    
    let title: String
    let index: Int
    
    init(title: String, index: Int) {
        self.title = title
        self.index = index
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func <(lhs: HomeMenuItem, rhs: HomeMenuItem) -> Bool {
        return lhs.index < rhs.index
    }
    
    static func ==(lhs: HomeMenuItem, rhs: HomeMenuItem) -> Bool {
        return (lhs.index == rhs.index && lhs.title == rhs.title)
    }
    
}

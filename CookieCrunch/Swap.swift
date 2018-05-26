//
//  Swap.swift
//  CookieCrunch
//
//  Created by Сергей Шальнов on 27.05.2018.
//  Copyright © 2018 Sergey Shalnov. All rights reserved.
//

import Foundation

struct Swap: CustomStringConvertible, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
    
    static func ==(lhs: Swap, rhs: Swap) -> Bool {
        return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
            (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
    }
}

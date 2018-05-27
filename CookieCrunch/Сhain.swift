//
//  Сhain.swift
//  CookieCrunch
//
//  Created by Сергей Шальнов on 27.05.2018.
//  Copyright © 2018 Sergey Shalnov. All rights reserved.
//

import Foundation

class Chain: Hashable, CustomStringConvertible {
    var cookies = [Cookie]()
    var score = 0
    
    enum ChainType: CustomStringConvertible {
        case horizontal
        case vertical
        
        var description: String {
            switch self {
            case .horizontal:
                return "horizontal"
            case .vertical:
                return "vertical"
            }
        }
    }
    
    var chainType: ChainType
    
    init(chain: ChainType) {
        self.chainType = chain
    }
    
    func add(cookie: Cookie) {
        cookies.append(cookie)
    }
    
    func firstCookie() -> Cookie {
        return cookies[0]
    }
    
    func lastCookie() -> Cookie {
        return cookies[cookies.count - 1]
    }
    
    var length: Int {
        return cookies.count
    }
    
    var description: String {
        return "type: \(chainType) cookie: \(cookies)"
    }
    
    var hashValue: Int {
        return cookies.reduce(0) { $0.hashValue ^ $1.hashValue }
    }
    
    static func == (lhs: Chain, rhs: Chain) -> Bool {
        return lhs.cookies == rhs.cookies
    }
    
}

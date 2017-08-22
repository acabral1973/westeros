//
//  Episode.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 16/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

final class Episode{
    
    let name    : String
    let date    : Date
    weak var season  : Season?
    
    init(name: String, date: Date , season: Season?) {
        (self.name, self.date, self.season) = (name, date, season)
    }
    
    convenience init(name: String, date: Date){
        self.init(name: name, date: date, season: nil)
    }
}

extension Episode {
    var proxy : String{
        return "\(name) \(date)"
    }
}

extension Episode : CustomStringConvertible{
    var description: String {
        return name
    }
}

extension Episode : Hashable{
    var hashValue : Int{
        get{
            return proxy.hashValue
        }
    }
}

extension Episode : Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

extension Episode : Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

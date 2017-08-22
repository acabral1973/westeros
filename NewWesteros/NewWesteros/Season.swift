//
//  Season.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 14/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season{
    let name: String
    let date: Date
    private var _episodes: Episodes
    
    init(name: String, date: Date) {
        (self.name, self.date) = (name, date)
        _episodes = Episodes()
    }
}

extension Season{
    var count : Int{
        return _episodes.count
    }
    
    func addEpisode(episode: Episode){
        
        // No se agregan episodios repetidos, ni un episodio que no pertenezca a la temporada
        if (_episodes.contains(episode)){
            return
        } else {
            guard episode.season?.name == self.name else {
                return
            }
            _episodes.insert(episode)
        }
    }
}

extension Season{
    // Devuelve los miembros de una casa ordenados
    func sortedEpisodes() -> [Episode]{
        return _episodes.sorted()
    }
}

extension Season{
    var proxy : String{
        get{
            return "\(name) \(date)"
        }
    }
}

extension Season : CustomStringConvertible{
    var description: String {
        return name
    }
}

extension Season : Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Season : Hashable{
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Season : Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

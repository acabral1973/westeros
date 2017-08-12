//
//  House.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 06/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

typealias Words = String
typealias Members = Set<Person>

final class Sigil{
    let description: String
    let image: UIImage
    
    init(image: UIImage, description: String){
        (self.description, self.image) = (description, image)
    }
}

final class House{
    let name:   String
    let sigil:  Sigil
    let words:  Words
    let wikiURL : URL
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
        _members = Members()
    }
}

extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        
        // No se agregan miembros repetidos
        if (_members.contains(person)){
            return
        } else {
            guard person.house.name == self.name else {
                return
            }
            _members.insert(person)
        }
    }
    
    // Para agregar varios miembros en una única operación (variadic version)
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Devuelve los miembros de una casa ordenados
    func sortedMembers() -> [Person]{
        return _members.sorted()
    }
}

extension House{
    var proxyForEquatable : String{
        get{
            return "\(name) \(words) \(count)"
        }
    }

    var proxyForComparable : String{
        get{
            return name.uppercased()
        }
    }
}

extension House : Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquatable == rhs.proxyForEquatable
    }
}

extension House : Hashable{
    var hashValue: Int {
        return proxyForEquatable.hashValue
    }
}

extension House : Comparable{
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparable < rhs.proxyForComparable
    }
}

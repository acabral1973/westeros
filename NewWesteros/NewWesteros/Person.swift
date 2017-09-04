//
//  Person.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 10/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

final class Person{
    
    let name    : String
    let house   : House
    private let _alias   : String?      // Como el alias es opcional lo hacemos privado y los manejamos con una propiedad computada
    
    var alias : String{
        get{
            return _alias ?? ""         // Si el alias es nil devuelve la cadena vacía, si no, devuelve el alias
        }
    }

    var fullName: String{
        get{
            return "\(name) \(house.name)"
        }
    }
    
    var fulNameAndAlias: String{
    
        get{
            if alias == ""{
                return fullName
            }
            return "\(fullName) (\"\(alias)\")"
        }
    }
    
    init(name: String, alias: String? , house: House) {
        
        self.name = name
        _alias = alias
        self.house = house
    }
    
    convenience init(name: String, house: House){
        self.init(name: name, alias: nil, house: house)
    }
}

extension Person {
    // Usamos la propiedad computada proxy para obtener un valor único para Hashable y para los protocolos comparativos
    // Como en una misma casa no pueden existir dos personajes cuyos nombres y alias coincidan, proxy es siempre única
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person : Hashable{
    var hashValue : Int{
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable{
    // Dos personajes son iguales si coinciden el nombre, el alias y la casa a la que pertenecen
    static func ==(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}


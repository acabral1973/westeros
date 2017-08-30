//
//  PersonTest.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 12/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import XCTest
@testable import NewWesteros

class PersonTest: XCTestCase {
    
    var starkImage : UIImage!
    var starkSigil : Sigil!
    var starkHouse : House!
    var robb : Person!
    var arya : Person!
    
    var lannisterImage : UIImage!
    var lannisterSigil : Sigil!
    var lannisterHouse : House!
    var tyrion : Person!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "starkImage.png")
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url:URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        
        lannisterImage = #imageLiteral(resourceName: "lannisterImage.jpg")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url:URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPersonExistence(){
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName(){
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    func testPersonEquality(){
        
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
    func testPersonHash() {
        
        XCTAssertNotNil(arya.hashValue)
    }
    
    func testPersonComparison(){
        
        XCTAssertLessThan(arya, robb)
    }
}

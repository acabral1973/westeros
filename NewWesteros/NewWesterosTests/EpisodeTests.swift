//
//  EpisodeTests.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 16/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import XCTest
@testable import NewWesteros

class EpisodeTests: XCTestCase {
    
    var episode1season1, episode2season1, episode1season2, episode2season2  : Episode!
    var season1, season2  : Season!
    let today1 = Date()
    let today2 = Date()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        season1 = Season(name: "Season 1", date: today1)
        season2 = Season(name: "Season 2", date: today2)
        episode1season1 = Episode(name: "Episode 1 Season 1", date: today1, season: season1)
        episode2season1 = Episode(name: "Episode 2 Season 1", date: today1, season: season1)
        episode1season2 = Episode(name: "Episode 1 Season 2", date: today1, season: season2)
        episode2season2 = Episode(name: "Episode 2 Season 2", date: today1, season: season2)
   }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode1season1)
    }
    
    func testEpisodeWithoutSeasonExistence(){
        let orphanEpisode = Episode(name: "Orphan Episode", date: today1)
        XCTAssertNotNil(orphanEpisode)
    }
    
    func testCustomStringConvertible(){
        XCTAssertEqual(episode1season1.description, "Episode 1 Season 1")
    }
    
    func testEpisodeEquality(){
        
        // Identidad
        XCTAssertEqual(episode1season1, episode1season1)
        
        // Igualdad
        let e1s1 = Episode(name: "Episode 1 Season 1", date: today1, season: season1)
        XCTAssertEqual(e1s1, episode1season1)
        
        // Desigualdad
        XCTAssertNotEqual(episode1season1, episode1season2)
        
    }
    
    func testPersonHash() {
        
        XCTAssertNotNil(episode1season1.hashValue)
    }
    
    func testPersonComparison(){
        
        XCTAssertLessThan(episode1season1, episode1season2)
    }
}

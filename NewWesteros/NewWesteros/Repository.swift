//
//  Repository.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 14/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
}

protocol WesterosFactory {
    
    typealias HouseFilter = (House)->Bool
    typealias SeasonFilter = (Season)->Bool
    
    var houses : [House] {get}
    var seasons : [Season] {get}
    
    func house(named: String)->House?
    func houses(filteredBy: HouseFilter) -> [House]

    func season(named: String)->Season?
    func seasons(filteredBy: SeasonFilter) -> [Season]

}

final class LocalFactory : WesterosFactory{
    
    func houses(filteredBy: HouseFilter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    func seasons(filteredBy: SeasonFilter) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var houses: [House]{
        get{
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three headed dragon")
            
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              url: starkURL)
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire & Blood",
                                  url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, jaime, cersei)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
    var seasons: [Season]{
        get{
            let today = Date()
            let season1 = Season(name: "Season 1", date: today)
            let season2 = Season(name: "Season 2", date: today)
            let season3 = Season(name: "Season 3", date: today)
            let season4 = Season(name: "Season 4", date: today)
            let season5 = Season(name: "Season 5", date: today)
            let season6 = Season(name: "Season 6", date: today)

            let episode1season1 = Episode(name: "Episode 1 Season 1", date: today, season: season1)
            let episode2season1 = Episode(name: "Episode 2 Season 1", date: today, season: season1)
            let episode1season2 = Episode(name: "Episode 1 Season 2", date: today, season: season2)
            let episode2season2 = Episode(name: "Episode 2 Season 2", date: today, season: season2)
            let episode1season3 = Episode(name: "Episode 1 Season 3", date: today, season: season3)
            let episode2season3 = Episode(name: "Episode 2 Season 3", date: today, season: season3)
            let episode1season4 = Episode(name: "Episode 1 Season 4", date: today, season: season4)
            let episode2season4 = Episode(name: "Episode 2 Season 4", date: today, season: season4)
            let episode1season5 = Episode(name: "Episode 1 Season 5", date: today, season: season5)
            let episode2season5 = Episode(name: "Episode 2 Season 5", date: today, season: season5)
            let episode1season6 = Episode(name: "Episode 1 Season 6", date: today, season: season6)
            let episode2season6 = Episode(name: "Episode 2 Season 6", date: today, season: season6)

            // Añadir episodios a las temporadas
            season1.addEpisode(episode: episode1season1)
            season1.addEpisode(episode: episode2season1)
            season2.addEpisode(episode: episode1season2)
            season2.addEpisode(episode: episode2season2)
            season3.addEpisode(episode: episode1season3)
            season3.addEpisode(episode: episode2season3)
            season4.addEpisode(episode: episode1season4)
            season4.addEpisode(episode: episode2season4)
            season5.addEpisode(episode: episode1season5)
            season5.addEpisode(episode: episode2season5)
            season6.addEpisode(episode: episode1season6)
            season6.addEpisode(episode: episode2season6)
            
            return [season1, season2, season3, season4, season5, season6].sorted()
        }
    }
    
    func house(named: String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }

    func season(named: String) -> Season? {
        let season = seasons.filter{$0.name.uppercased() == named.uppercased()}.first
        return season
    }
}

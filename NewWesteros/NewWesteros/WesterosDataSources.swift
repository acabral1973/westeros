//
//  WesterosDataSources.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 1/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

final class WesterosDataSources{
    
    static func houseDataSource(model: [House]) -> ArrayDataSource<House>{
    
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "HouseCell"
            
            // Crear una celda
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                // La creo a pelo
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            // sincronizar House -> Cell
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = house.words
            
            return cell!
        })
    }
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person>{
        
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "PersonCell"
            
            // Crear una celda
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                // La creo a pelo
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // sincronizar Person -> Cell
            cell?.textLabel?.text = "\(person.fulNameAndAlias)"
            
            return cell!
        })
    }
    
    static func seasonDataSource(model: [Season]) -> ArrayDataSource<Season>{
        
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "SeasonCell"
            
            // Crear una celda
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                // La creo a pelo
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // sincronizar Season -> Cell
            cell?.textLabel?.text = "\(season.name) (launched \(season.date.esFormatted()))"
            
            return cell!
        })
    }
    
    static func episodeDataSource(model: [Episode]) -> ArrayDataSource<Episode>{
        
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "EpisodeCell"
            
            // Crear una celda
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            
            if cell == nil {
                // La creo a pelo
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            // sincronizar Episode -> Cell
            cell?.textLabel?.text = "\(episode.name) (\(episode.date.esFormatted()))"
            
            return cell!
        })
    }


}


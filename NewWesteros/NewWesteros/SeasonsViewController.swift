//
//  SeasonsViewController.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 20/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class SeasonsViewController: UITableViewController {
        
    let model : [Season]
    
    init(model: [Season]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "SeasonCell"
        
        // Descubrir cuala es la casa que tenemos que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // La creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar Season -> Cell
        cell?.textLabel?.text = season.name
        
        return cell!
    }
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        // Averiguamos cuala es la temporada
        let season = model[indexPath.row]
        
        // la mostramos
        let SeasonVC = SeasonViewController(model: season.sortedEpisodes(), seasonName: season.name)
        navigationController?.pushViewController(SeasonVC, animated: true)
        
    }
}

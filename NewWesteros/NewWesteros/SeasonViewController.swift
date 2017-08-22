//
//  SeasonViewController.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 20/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class SeasonViewController: UITableViewController {
        
    let model : [Episode]
    
    init(model: [Episode], seasonName: String){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "EpisodeCell"
        
        // Obtenemos la persona que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // Creamos una celda reutilizando o creándola a pelo
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizamos Season -> Cell
        cell?.textLabel?.text = episode.name
        
        return cell!
    }
}

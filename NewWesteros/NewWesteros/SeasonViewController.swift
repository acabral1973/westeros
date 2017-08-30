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
        
        title = "\(seasonName) Episodes"
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
        
        // Obtenemos el episodio que tenemos que mostrar en la celda
        let episode = model[indexPath.row]
        
        // Creamos una celda reutilizando o creándola a pelo
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // envio los datos del modelo (episodio) a la celda
        cell?.textLabel?.text = "\(episode.name) (\(episode.date.esFormatted()))"
        
        return cell!
    }
    
    // función que controla que hacer cuando el usuario pushea una celda (mostrar episodio)
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        // Averiguamos cuala es el episodio seleccionado
        let episode = model[indexPath.row]
        
        // creo un EpisodeViewController con los datos del episodio seleccionado y lo pusheo
        let episodeVC = EpisodeViewController(model: episode)
        navigationController?.pushViewController(episodeVC, animated: true)
        
    }

}

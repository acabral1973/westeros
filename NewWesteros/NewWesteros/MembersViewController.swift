//
//  MembersViewController.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 14/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class MembersViewController: UITableViewController {

    let model : [Person]
    
    init(model: [Person], houseName: String){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "\(houseName)'s Members"
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
        
        let cellID = "PersonCell"
        
        // Obtenemos la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Creamos una celda reutilizando o creándola a pelo
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizamos House -> Cell
        cell?.textLabel?.text = person.fullName
        
        return cell!
    }
}

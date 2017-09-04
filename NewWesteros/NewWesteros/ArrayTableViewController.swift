//
//  ArrayTableViewController.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 1/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

// definimos una clase que hereda de UITableViewController y aporta la funcionalidad de poder gestionar
// tablas genéricas, o lo que es lo mismo, tablas cuyas celdas muestran contenidos de cualquier tipo

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource : ArrayDataSource<Element>               // el dataSource es un array de "cosas" que serán los contenidos a mostrar en la tabla
    let arrayDelegate : GenericDelegate<Element>?           // el arrayDelegate será el Delegado que usaremos para indicar a la app que hacer cuando un usuario pushea sobre una celda
    
    init(dataSource: ArrayDataSource<Element>,
         title: String, style: UITableViewStyle,
         delegate: GenericDelegate<Element>? = nil){
        
        
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        super.init(style: style)
        
        self.tableView.dataSource = self.dataSource
        
        self.arrayDelegate?.viewController = self
        self.arrayDelegate?.source = dataSource
        
        self.tableView.delegate = self.arrayDelegate as? UITableViewDelegate
        
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

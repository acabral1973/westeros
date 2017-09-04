//
//  ArrayDataSource.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 31/8/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

// definimos una clase genérica que tendrá dos elementos que pueden cambiar y que debemos definir al instanciar la clase
// el datasource, que en nuestro cso será un array de House o Person y una clausura, que será una función que indica
// cómo se construye la celda (incluido cualquier formato que queramos aplicar)

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
    
    typealias Elements = [Element]                                      //Define que el datasource es un array de "algo"
    typealias CellMaker = (Element, UITableView) -> UITableViewCell     //indica que la clausura recibirá un elemento (donde estan los datos a mostrar)
                                                                        //y una tabla (la necesita para lo de reaprovechar celdas) y devuelve una celda
    
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker){
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }

    // indica cuantas secciones tiene la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // indica cuantas filas tiene la sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }

    // Devuelve el elemento seleccionado en una tabla
    func element(atIndexPath indexPath: IndexPath) -> Element{
        return _model[indexPath.row]
    }
    
    // indica como se construye la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let element = _model[indexPath.row]
        return _cellMaker(element, tableView)
    }
}

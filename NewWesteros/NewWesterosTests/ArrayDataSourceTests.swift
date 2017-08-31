//
//  ArrayDataSourceTests.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 31/8/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import XCTest
@testable import NewWesteros

class ArrayDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayDataSourceCreation(){
        
        let ds = ArrayDataSource(model: [1,2,3,4]) {(number: Int, tableView: UITableView) -> UITableViewCell in
        
            //aqui defino la clausura que será quien genere la celda
            let cellID = "NumberCell"
        
            // Creamos una celda reutilizando o creándola a pelo
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
        
            // envio los datos del modelo (un número) a la celda
            cell?.textLabel?.text = "Numero \(number)"
            return cell!
        }
        XCTAssertNotNil(ds)
    }
}

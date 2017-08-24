//
//  FoundationExtensions.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 23/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import Foundation

extension Date{
    
    func esFormatted() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "es_EC")
        dateFormatter.setLocalizedDateFormatFromTemplate("ddMMyyyy")
        return dateFormatter.string(from: self)
    }
}

extension String{
    
    func toDate() -> Date{
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yyyy"
        return dateStringFormatter.date(from: self)!
    }
}

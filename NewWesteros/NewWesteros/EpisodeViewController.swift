//
//  EpisodeViewController.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 30/8/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeData: UILabel!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeDate: UILabel!
    
    let model : Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func syncViewWithModel(){
        
        // paso los datos del modelo a la vista
        episodeData.text = model.season?.name
        episodeName.text = "Episode \(model.name)"
        episodeDate.text = "released date: \(model.date.esFormatted())"
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        syncViewWithModel()
    }
}

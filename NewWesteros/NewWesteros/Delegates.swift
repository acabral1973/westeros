//
//  Delegates.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 1/9/17.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

// En general, el delegado de una table view necesitará:
// 1. El dataSource que tiene los datos para saber sobre qué elemento tienen que ejecutarse las acciones (en nuestro caso sobre qué fila se ha pusheado)
// 2. El UIViewController que va a mostrar ese elemento (en nuestro caso HouseViewController, PersonViewController, etc)
// 3. El UIViewController del que es delegado para poder acceder a su navigationController y hacer un push.

class GenericDelegate<Element> : NSObject{
    
    // Esta es la clase genérica de Delegados, aqui necesitaremos identificar el dataSource y el UIViewController al que ayuda el delegado
    // El UIViewController que mostrará el elemento seleccionado depende del tipo del elemento, por lo que no podemos ponerlo aqui
    
    var source : ArrayDataSource<Element>?
    var viewController : UIViewController?
}

final class HousesDelegate: GenericDelegate<House>, UITableViewDelegate{
    
    // En esta clase implementamos el delegado de Houses, y ya sabemos cual es el UIViewController que hemos de usar para mostrar el elemento seleccionado 
    // usaremos HouseViewController, que es el controlador que muestra todos los datos de la casa y permite acceder a la Wiki y a la lista de miembros
    // En este caso sólo es necesario implementar el método del delegado que controla lo que pasa cuando el usuario hace push sobre una celda
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class SeasonsDelegate: GenericDelegate<Season>, UITableViewDelegate{
    
    // En esta clase implementamos el delegado de Seasons, y ya sabemos cual es el UIViewController que hemos de usar para mostrar el elemento seleccionado
    // usaremos nuevamente el controlador genérico ArrayTableViewController, pero esta vez usando como tipo para el contructor, al array de Episode que cuelga de cada Season
    // previamente, deberemos transformar este array en un datasource válido para la clase ArrayTableViewController
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let episodesDataSource = WesterosDataSources.episodeDataSource(model: season.sortedEpisodes())
            let vc = ArrayTableViewController(dataSource: episodesDataSource, title: season.name, style: .plain, delegate: SeasonDelegate())
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class SeasonDelegate: GenericDelegate<Episode>, UITableViewDelegate{
    
    // En esta clase implementamos el delegado de Season, que se utiliza cuando estamos mostrando la lista de sesiones y el usuario hace un push sobre una celda
    // tendremos que mostrar la lista de episodios de esa Season, por lo que volvemos a tener que mostrar un atabla, por ello usamos nuevamente el , el datasource  celda y para , y ya sabemos cual es el UIViewController que hemos de usar para mostrar el elemento seleccionado
    // usaremos SeasonViewController, que es el controlador que muestra una tabla con todos los Episode de la Season
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}

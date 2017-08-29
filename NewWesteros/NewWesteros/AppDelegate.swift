//
//  AppDelegate.swift
//  NewWesteros
//
//  Created by Alejandro Cabral Benavente on 06/08/2017.
//  Copyright © 2017 Smartech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // Creo orígenes de datos para Temporadas y Casas basado en el repositorio local
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Creo los controladores para Temporadas y Casas
        let housesVC = HousesViewController(model: houses).wrappedInNavigation()
        housesVC.tabBarItem.title = "Houses"
        housesVC.tabBarItem.image = UIImage(named: "housesIcon")
        let seasonsVC = SeasonsViewController(model: seasons).wrappedInNavigation()
        seasonsVC.tabBarItem.title = "Seasons"
        seasonsVC.tabBarItem.image = UIImage(named: "seasonsIcon")
        
        // Creo el combinador y personalizo aspecto
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().tintColor = UIColor.white
        let mainVC = UITabBarController()
        
        // Asigno los controladores para Temporadas y Casas como Items del combinador
        mainVC.viewControllers = [housesVC, seasonsVC]
        
        // Declaro el combinador como controlador principal
        window?.rootViewController = mainVC
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func didFinishLaunchingWithOptions(_ application: UIApplication) {
        let tabBarAppearance = UITabBar.appearance()
        
        tabBarAppearance.tintColor = UIColor.white
        tabBarAppearance.barTintColor = UIColor.black
    }
}


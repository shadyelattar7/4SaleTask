//
//  AppDelegate.swift
//  4Sale
//
//  Created by Al-attar on 02/06/2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: AppCoordinator!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        coordinator = AppCoordinator(window: window!)
        coordinator.start()
        
        return true
    }
}

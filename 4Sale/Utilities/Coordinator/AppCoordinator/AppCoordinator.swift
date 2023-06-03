//
//  AppCoordinator.swift
//  Link-Me
//
//  Created by Al-attar on 10/05/2023.
//

import Foundation
import UIKit


protocol Coordinator{
    var Main: MainNavigator {get}
    var navgationController: UINavigationController? {get}
    func start()
}

class AppCoordinator: Coordinator{
    
    let window: UIWindow
  
    lazy var Main: MainNavigator = {
        return .init(coordinator: self)
    }()
    
    var navgationController: UINavigationController?{
        if let navgationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController{
            return navgationController
        }else{
            print("Error")
            return nil
        }
        //        if let navgationController = tabbar.selectedViewController as? UINavigationController{
        //            return navgationController
        //        }else{
        //            return nil
        //        }
    }
    
    init(window: UIWindow = UIWindow()){
        self.window = window
        
    }
    
    
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    
    var rootViewController: UIViewController{
        let LeagueVC = self.Main.viewcontroller(for: .League)
        let nav = UINavigationController(rootViewController: LeagueVC)
        return nav
    }
}


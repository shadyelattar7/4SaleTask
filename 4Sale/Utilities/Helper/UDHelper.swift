//
//  Helper.swift
//  Link-Me
//
//  Created by Al-attar on 13/05/2023.
//

import Foundation
import UIKit

class UDHelper {
    
    private static let userDefaults = UserDefaults.standard
    
    static var isAppOpenedBefor: Bool {
        set { UDHelper.userDefaults.set(newValue, forKey: UDKeys.appOpenedBrfore) }
        get { UDHelper.userDefaults.bool(forKey: UDKeys.appOpenedBrfore) }
    }
    
    static var token: String {
        set {UDHelper.userDefaults.set(newValue, forKey: UDKeys.token)}
        get { UDHelper.userDefaults.string(forKey: UDKeys.token) ?? "" }
        
    }
    
    static var isAfterLoginOrRegister: Bool{
        set { UDHelper.userDefaults.set(newValue, forKey: UDKeys.isLoginOrRegister) }
        get { UDHelper.userDefaults.bool(forKey: UDKeys.isLoginOrRegister) }
    }
    
   
    
    static var isSkip: Bool{
        set { UDHelper.userDefaults.set(newValue, forKey: UDKeys.isSkip) }
        get { UDHelper.userDefaults.bool(forKey: UDKeys.isSkip) }
    }
    
    static var isChangeLang: Bool{
        set { UDHelper.userDefaults.set(newValue, forKey: UDKeys.isChangeLang) }
        get { UDHelper.userDefaults.bool(forKey: UDKeys.isChangeLang) }
    }
    
}

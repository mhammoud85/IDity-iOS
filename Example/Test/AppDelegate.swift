//
//  AppDelegate.swift
//  Test
//
//  Created by Mohamad Hammoud on 20/04/2026.
//

import UIKit
import IDity

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IDitySDK.initialize(clientKey: "CLIENTKEY", tintColor: .systemRed)
        
        return true
    }
}


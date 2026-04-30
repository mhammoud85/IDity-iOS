//
//  AppDelegate.swift
//  Example
//
//  Created by beIN MOBILES on 29/04/2026.
//

import UIKit
import IDity

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IDitySDK.initialize(clientKey: "3274356529522985", recognitionLanguages: [.ar, .en, .fr], tintColor: .systemRed)
        
        return true
    }
}


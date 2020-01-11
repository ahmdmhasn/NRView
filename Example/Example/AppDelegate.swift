//
//  AppDelegate.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NRView.Properties.color = .yellow
        
        return true
    }

}


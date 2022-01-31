//
//  AppDelegate.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainVC = UserListViewController()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        
        return true
    }

    

}


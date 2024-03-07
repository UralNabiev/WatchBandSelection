//
//  AppDelegate.swift
//  WatchBandSelection
//
//  Created by O'ral Nabiyev on 03/03/24.
//
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = WatchBandSelectionVC(nibName: "WatchBandSelectionVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        
        return true
    }


}

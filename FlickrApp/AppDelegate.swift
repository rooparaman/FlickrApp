// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coordinator: AppCoordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    coordinator = AppCoordinator(window: window!)
    coordinator?.start()
    
    return true
  }


}


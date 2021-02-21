// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit

class AppCoordinator: Coordinator {
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let navigationController = UINavigationController()
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    let flickrSearchCoordinator = FlickrSearchCoordinator(navigationController: navigationController)
      coordinate(to: flickrSearchCoordinator)
    
  }
}

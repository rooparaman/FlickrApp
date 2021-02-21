// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit
class FlickrSearchCoordinator: Coordinator {
  let navigationController: UINavigationController
  private lazy var  flickrSearchViewController = FlickrSearchViewController.instantiate(from: .main)
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  func start() {
    navigationController.pushViewController(flickrSearchViewController, animated: true)
  }
}

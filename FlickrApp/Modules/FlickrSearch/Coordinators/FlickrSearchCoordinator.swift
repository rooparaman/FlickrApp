// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit
class FlickrSearchCoordinator: Coordinator {
  let navigationController: UINavigationController
  private lazy var  flickrSearchViewController = FlickrSearchViewController.instantiate(from: .flickrSearch)
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  func start() {
    let flickrSearchViewModel = FlickrSearchViewModel(with: FlickrSearchService())
    flickrSearchViewController.viewModel = flickrSearchViewModel
    navigationController.pushViewController(flickrSearchViewController, animated: true)
  }
}

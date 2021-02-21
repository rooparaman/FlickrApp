// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation

protocol Coordinator {
  func start()
  func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
  func coordinate(to coordinator: Coordinator) {
    coordinator.start()
  }
}

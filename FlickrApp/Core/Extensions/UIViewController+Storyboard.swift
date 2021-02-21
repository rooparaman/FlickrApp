// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
import UIKit

enum Storyboard: String {
  case main = "Main"
}

extension UIViewController {
  
  static var className: String {
    NSStringFromClass(Self.self).components(separatedBy: ".").last!
  }
  
  static func instantiate(from storyboard: Storyboard, identifier: String? = nil) -> Self {
    UIStoryboard(name: storyboard.rawValue, bundle: Bundle(for: Self.self)).instantiateViewController(identifier: identifier ?? className) as! Self
  }
}

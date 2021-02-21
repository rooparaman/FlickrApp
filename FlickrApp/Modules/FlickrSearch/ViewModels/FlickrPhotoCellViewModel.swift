// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import UIKit

class FlickrPhotoCellViewModel {
  var imageUrl: String
  var image: Box<UIImage> = Box(UIImage(named: Constants.placeHolderImage)!)
  var service: FlickrSearchService
  
  init(imageUrl: String, service: FlickrSearchService) {
    self.imageUrl = imageUrl
    self.service = service
  }
  
  func loadImage(urlSting: String){
    if let _ = URL(string: urlSting) {
      service.downloadImage(url: urlSting) {(data) in
        guard let imageFromUrl = UIImage(data: data) else { return }
        self.image.value = imageFromUrl
      } failureCompletion: {(_) in
        self.image.value = UIImage(named: Constants.placeHolderImage)!
      }
    }
  }
}

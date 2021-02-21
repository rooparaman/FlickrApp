// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
class FlickrSearchViewModel {
  var photos: Box<[FlickrPhotoModel]> = Box([])
  var pageNo: Int = 0
  var totalNo: Int = 0
  var flickrService : FlickrSearchService
  let errorReason = Box("")
  let hasFailed = Box(false)
  var isLoading = false
  
  init(with service: FlickrSearchService) {
    self.flickrService = service
  }
  
  func fetchPhotos(for title: String, page: Int){
    guard !isLoading else {
      return
    }
    isLoading = true
    flickrService.getPhotos(searchText: title, page: page) {[weak self] (flickrResults) in
      guard let self = self else { return }
      if page > self.totalNo {
        return
      }
      if page > 0 {
        self.photos.value.append(contentsOf: flickrResults.photos)
      } else {
        self.photos.value = flickrResults.photos
        if self.photos.value.count == 0 {
          self.errorReason.value = "Oops no Images! Please try again or search something else"
        }
      }
      self.pageNo = flickrResults.currentPage
      self.totalNo = flickrResults.totalPhotos
    } failureCompletion: {[weak self] (error) in
      guard let self = self else { return }
      self.hasFailed.value = true
      self.errorReason.value = error.description
    }

  }
}

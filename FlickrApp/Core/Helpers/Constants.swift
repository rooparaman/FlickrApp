// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
struct Constants {
  static let getFlickrUrl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=96358825614a5d3b1a1c3fd87fca2b47&format=json&nojsoncallback=1&per_page=21"
  
  enum error : String {
    case dataMappingError = "Data is corrupt. Please contact admin"
    case networkError = "Network error has occured. Please check your connection  and try again"
    case unknownError = "Unknown Error has occured. Please try after sometime"
    case unauthorizedError = "Unauthorized"
    case accessError = "You do not have the access rights. Contact admin"
    case serverError = "An unexpected server error occurred."
  }
}

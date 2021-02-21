// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
struct FlickrDataModel: Codable {
  let photos: FlickrPhotoResultsDataModel
}
struct FlickrPhotoResultsDataModel: Codable{
  let page: Int
  let pages: Int
  let perpage: Int
  let total: String
  let photo: [FlickrPhotoDataModel]
}

struct FlickrPhotoDataModel: Codable{
  let id: String
  let owner: String
  let secret: String
  let server: String
  let farm: Int
  let title: String
  let ispublic:Int
  let isfriend:Int
  let isfamily:Int
}

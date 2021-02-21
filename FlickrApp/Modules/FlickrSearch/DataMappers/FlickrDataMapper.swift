// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
struct FlickrDataMapper {
  func parseJson(flickrData:Data) -> FlickrModel? {
    let decoder = JSONDecoder.init()
    do {
      let decodedData = try decoder.decode(FlickrDataModel.self, from: flickrData)
      var photos: [FlickrPhotoModel] = []
      
      for data in decodedData.photos.photo {
          photos.append(FlickrPhotoModel(id: data.id,
                                       owner: data.owner,
                                       imageUrl: mapImageUrl(farm: data.farm,
                                                             server: data.server,
                                                             id: data.id,
                                                             secret: data.secret),
                                       title: data.title,
                                       isPublic: data.ispublic == 1 ? true : false,
                                       isFamily: data.isfamily == 1 ? true : false,
                                       isFriend: data.isfriend == 1 ? true : false
                                       ))
      }
      
      return FlickrModel(currentPage: decodedData.photos.page,
                         totalPhotos: Int(decodedData.photos.total) ?? 0,
                         perPageCount: decodedData.photos.perpage,
                         photos: photos)
    } catch {
      print(error)
      return nil
    }
  }
  
  func mapImageUrl(farm: Int, server: String, id:String, secret: String) -> String {
    return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
  }
}

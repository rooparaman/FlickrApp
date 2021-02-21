// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
struct FlickrSearchService {
  private let apiService = APIService()
  private let dataMapper = FlickrDataMapper()

  func getPhotos(searchText: String,page: Int, successCompletion: @escaping(FlickrModel)-> (), failureCompletion: @escaping(CustomError)-> ()){
    
    let urlString = "\(Constants.getFlickrUrl)&text=\(searchText)&page=\(page)"
    if let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
      apiService.get(with: url) { (result) in
        switch result {
        case .failure(let error):
          failureCompletion(error)
        case .success(let data):
          if let info = dataMapper.parseJson(flickrData: data) {
            successCompletion(info)
          }else {
            failureCompletion(CustomError.mappingError)
          }
        }
      }
    }
    
  }

  func downloadImage(url: String,completion: @escaping (Data) -> (), failureCompletion: @escaping (CustomError)-> ()) {
    apiService.get(with: url) { (result) in
      switch result {
      case .failure(let error):
        failureCompletion(error)
      case .success(let data):
        completion(data)
      }
    }
  }
}

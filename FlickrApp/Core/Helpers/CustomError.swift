// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import Foundation
enum CustomError: Error {
  //Throw in service transport error
  case transportError(error: Error)
  
  // Throw in all other server errors
  case serverSideError(code: Int)
  
  //Throw in json mapping error
  case mappingError
  
  //All other cases
  case unknowError
}
//MARK: - CustomStringConvertible
extension CustomError : CustomStringConvertible {
  public var description: String {
    switch self {
    case .serverSideError(let code):
      return descriptionForCode(code: code)
    case .mappingError:
      return Constants.error.dataMappingError.rawValue
    case .transportError(_):
      return Constants.error.networkError.rawValue
    case .unknowError:
      return Constants.error.unknownError.rawValue
    }
  }
  
  //To get the description based on the status code
  private func descriptionForCode(code: Int) -> String{
    switch code {
    case 401:
      return Constants.error.unauthorizedError.rawValue
    case 403:
      return Constants.error.accessError.rawValue
    case 500...599:
      return Constants.error.serverError.rawValue
    default:
      return Constants.error.serverError.rawValue
    }
  }
}

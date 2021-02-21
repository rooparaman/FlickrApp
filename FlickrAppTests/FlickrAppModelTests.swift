// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import XCTest
@testable import FlickrApp

class FlickrAppModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlickrModel() throws {
      let flickrPhoto = FlickrPhotoModel(id: "123",
                                         owner: "Roopa",
                                         imageUrl: "r123.jpg",
                                         title: "sample",
                                         isPublic: false,
                                         isFamily: false,
                                         isFriend: false)
      XCTAssertEqual(flickrPhoto.id, "123")
      XCTAssertEqual(flickrPhoto.owner, "Roopa")
      XCTAssertEqual(flickrPhoto.imageUrl, "r123.jpg")
      XCTAssertEqual(flickrPhoto.title, "sample")
      XCTAssertEqual(flickrPhoto.isPublic, false)
      XCTAssertEqual(flickrPhoto.isFamily, false)
      XCTAssertEqual(flickrPhoto.isFriend, false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

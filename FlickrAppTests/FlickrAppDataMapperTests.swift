// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import XCTest
@testable import FlickrApp

class FlickrAppDataMapperTests: XCTestCase {
  private var dataMapper = FlickrDataMapper()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMapper() throws {
      let bundle = Bundle(for: type(of: self))
      guard let bundlePath = bundle.url(forResource: "mockData", withExtension: "json") else {
        XCTFail("Missing file: mockData.json")
        return
      }
      do{
        let jsonData = try Data(contentsOf: bundlePath)
        let flickrInfo = dataMapper.parseJson(flickrData: jsonData)
          
        XCTAssertEqual(flickrInfo?.currentPage, 1)
        XCTAssertEqual(flickrInfo?.perPageCount, 100)
        XCTAssertEqual(flickrInfo?.photos.first?.id, "50961155733")
        XCTAssertEqual(flickrInfo?.photos.first?.imageUrl, "https://farm66.static.flickr.com/65535/50961155733_86a08d6928.jpg")
        XCTAssertEqual(flickrInfo?.photos.first?.isFamily, false)
        XCTAssertEqual(flickrInfo?.photos.first?.owner, "61227541@N03")
        XCTAssertEqual(flickrInfo?.photos.first?.title, "The 1949 Ford 8N Tractor ...")
        XCTAssertEqual(flickrInfo?.photos.first?.isFriend, false)
        XCTAssertEqual(flickrInfo?.photos.first?.isPublic, true)
        
      }catch {
        XCTFail("Could not parse")
      }
    }

}

// Created by Roopa Raman on 21/2/21
// 
// Using Swift 5.0

import XCTest

class FlickrAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchPage() throws {
      let app = XCUIApplication()
      app.launch()
      XCUIDevice.shared.orientation = .portrait

      XCTAssertTrue(app.searchFields["Search Image"].exists)
      app.searchFields["Search Image"].tap()
      app.searchFields["Search Image"].typeText("Dogs")
      XCUIApplication().keyboards.buttons["search"].tap()
      
      
      let collectionViewsQuery = app.collectionViews
      let colCell = collectionViewsQuery.cells.firstMatch
      let exists = NSPredicate(format: "exists == true")
      expectation(for: exists, evaluatedWith: colCell, handler: nil)
      waitForExpectations(timeout: 5, handler: nil)
      XCTAssertTrue(colCell.images["flickrImage"].exists)
      sleep(1)
      collectionViewsQuery.children(matching: .cell).element(boundBy: 10).children(matching: .other).element.swipeUp()
      collectionViewsQuery.children(matching: .cell).element(boundBy: 16).children(matching: .other).element.swipeUp()
      XCUIDevice.shared.orientation = .landscapeRight
      
      XCUIDevice.shared.orientation = .portraitUpsideDown
      XCUIDevice.shared.orientation = .landscapeLeft
      XCUIDevice.shared.orientation = .portrait
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

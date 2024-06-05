//
//  HealthListViewTests.swift
//  HealthSearchTests
//
//  Created by Vitor Pires on 04/06/24.
//

import XCTest
@testable import HealthSearch

final class HealthListViewTests: XCTestCase {

    // MARK: - Subject under test
    
    var viewModelSpy: HealthListViewModelSpy!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        viewModelSpy = HealthListViewModelSpy()
    }
    
    override func tearDown() {
        viewModelSpy = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    @MainActor func test_displayData_callsPrepareData() async {
        let sut = HealthListView(viewModel: viewModelSpy)
        
        _ = await sut.displayData()
        
        XCTAssertEqual(viewModelSpy.prepareDataWasCalled, 1)
    }
}

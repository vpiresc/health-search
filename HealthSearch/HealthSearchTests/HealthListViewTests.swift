//
//  HealthListViewTests.swift
//  HealthSearchTests
//
//  Created by Vitor Pires on 04/06/24.
//

import XCTest
@testable import HealthSearch

final class HealthListViewModelSpy: HealthListViewModel {
    var pageTitle: String = "Page title"
    
    var providersNames: [String] = ["H1","H2","H3",]
    var prepareDataWasCalled = 0
    
    func searchResults(_ searchText: String) -> [String] {
        return providersNames
    }
    
    func prepareData() async throws {
        prepareDataWasCalled += 1
    }
}

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

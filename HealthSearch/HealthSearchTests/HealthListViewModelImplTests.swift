//
//  HealthSearchTests.swift
//  HealthSearchTests
//
//  Created by Vitor Pires on 04/06/24.
//

import XCTest
@testable import HealthSearch

final class HealthListViewModelImplTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: HealthListViewModelImpl!
    var serviceMock: NetworkServiceMock!
    
    // MARK: - Test lifecycle
    
    @MainActor override func setUp() {
        super.setUp()
        serviceMock = NetworkServiceMock()
        sut = HealthListViewModelImpl(service:  serviceMock)
    }
    
    override func tearDown() {
        sut = nil
        serviceMock = nil
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_prepareData_callsServiceLoad() async {
        do {
            _ = try await sut.prepareData()
            XCTAssertEqual(serviceMock.loadWasCalled, 1)
        } catch {
            XCTFail("prepareData should not return any error")
        }
    }
    
    @MainActor func test_prepareData_succeedsWithOneValueForSearchResults() async {
        let result = resultValuesFor("H1")
        
        XCTAssertEqual(result, ["H1"])
        XCTAssertEqual(result.count, 1)
        
    }
    
    @MainActor func test_prepareData_succeedsWithThreeValuesForSearchResults() async {
        let result = resultValuesFor("H")
        
        XCTAssertEqual(result, ["H1","H2","H3"])
        XCTAssertEqual(result.count, 3)
        
    }
    
    @MainActor func test_prepareData_succeedsWithEmptyValuesForSearchResults() async {
        let result = resultValuesFor("")
        
        XCTAssertEqual(result, ["H1","H2","H3"])
        XCTAssertEqual(result.count, 3)
        
    }

    // MARK: - Helpers
    
    @MainActor private func resultValuesFor(_ searchText: String) -> [String] {
        sut.providersNames = ["H1","H2","H3"]
        return sut.searchResults(searchText)
    }
    
}

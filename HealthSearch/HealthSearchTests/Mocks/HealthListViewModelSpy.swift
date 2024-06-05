//
//  HealthListViewModelSpy.swift
//  HealthSearchTests
//
//  Created by Vitor Pires on 05/06/24.
//

import Foundation
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

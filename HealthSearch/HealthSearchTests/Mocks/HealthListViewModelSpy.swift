//
//  HealthListViewModelSpy.swift
//  HealthSearchTests
//
//  Created by Vitor Pires on 05/06/24.
//

import Foundation
@testable import HealthSearch

final class HealthListViewModelSpy: HealthListViewModel {
    var providersNames: [Provider] = []
    var pageTitle: String = "Page title"
    var prepareDataWasCalled = 0
    
    func searchResults(_ searchText: String) -> [Provider] {
        return providersNames
    }
    
    func prepareData() async throws {
        prepareDataWasCalled += 1
    }
}

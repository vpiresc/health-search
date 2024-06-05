//
//  NetworkServiceMock.swift
//  HealthSearchTests
//
//  Created by Vitor Pires on 04/06/24.
//

import Foundation
@testable import HealthSearch

final class NetworkServiceMock: NetworkService {
    var loadWasCalled = 0
    func load() async throws -> ProviderResponse {
        loadWasCalled += 1
        return ProviderResponse(data: [])
    }
}

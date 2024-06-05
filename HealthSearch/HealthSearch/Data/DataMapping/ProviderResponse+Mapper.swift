//
//  ProviderResponse+Mapper.swift
//  HealthSearch
//
//  Created by Vitor Pires on 05/06/24.
//

import Foundation

extension ProviderResponse {
    func toData() -> ProviderModel {
        .init(data: self.data)
    }
}

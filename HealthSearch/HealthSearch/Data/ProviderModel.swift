//
//  ProviderModel.swift
//  HealthSearch
//
//  Created by Vitor Pires on 04/06/24.
//

import Foundation
struct ProviderModel: Decodable {
    let data: [Provider]
}

struct Provider: Decodable {
    let name: String
}

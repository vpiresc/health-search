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

struct Provider: Decodable, Equatable, Identifiable {
    var id = UUID()
    let name: String
    
    func contains(text: String) -> Bool {
        return name.contains(text)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

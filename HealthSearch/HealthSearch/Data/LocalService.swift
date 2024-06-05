//
//  LocalService.swift
//  HealthSearch
//
//  Created by Vitor Pires on 04/06/24.
//

import Foundation

class LocalService: NetworkService {
    func load() -> ProviderModel {
        let filename = Constants.providersName
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle: \(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ProviderModel.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(ProviderModel.self): \(error)")
        }
    }
}

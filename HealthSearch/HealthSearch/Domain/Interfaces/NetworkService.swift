//
//  NetworkService.swift
//  HealthSearch
//
//  Created by Vitor Pires on 04/06/24.
//


import Foundation

protocol NetworkService {
    func load() async throws -> ProviderResponse
}

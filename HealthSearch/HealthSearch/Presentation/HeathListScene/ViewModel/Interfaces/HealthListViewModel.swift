import Foundation
import SwiftUI

protocol HealthListViewModellDisplayLogic {
    func displayData() async
}

protocol HealthListViewModelInputLogic {
    func prepareData() async throws
}

@MainActor
protocol HealthListViewModelOutputLogic {
    var pageTitle: String { get }
    var providersNames: [String] { get }
    func searchResults(_ searchText: String) -> [String]
}

protocol HealthListViewModel: HealthListViewModelInputLogic, HealthListViewModelOutputLogic, ObservableObject {}

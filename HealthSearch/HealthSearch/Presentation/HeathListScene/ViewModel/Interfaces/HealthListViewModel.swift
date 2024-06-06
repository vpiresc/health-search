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
    var providersNames: [Provider] { get }
    func searchResults(_ searchText: String) -> [Provider]
}

protocol HealthListViewModel: HealthListViewModelInputLogic, HealthListViewModelOutputLogic, ObservableObject {}

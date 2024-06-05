import Foundation

@MainActor
class HealthListViewModelImpl: HealthListViewModel {
    @Published var pageTitle: String = ""
    @Published var providersNames: [String] = []

    private let service: NetworkService
    
    init(service: NetworkService = LocalService()) {
        self.service = service
    }
}

extension HealthListViewModelImpl {
    func prepareData() async throws {
        do {
            let providerViewModel = try await service.load().toData()
            pageTitle = Constants.homeScreenName
            providersNames = makeProvidersNames(providerViewModel.data)
        } catch {
            throw(NetworkError.unableToLoad)
        }
    }
    
    func searchResults(_ searchText: String) -> [String] {
        if searchText.isEmpty { providersNames }
        else { providersNames.filter { $0.contains(searchText) }
        }
    }
    
    private func makeProvidersNames(_ providers: [Provider]) -> [String] {
        var names: [String] = []
        for index in 0..<providers.count {
            names.append(providers[index].name)
        }
        return names
    }
    

}

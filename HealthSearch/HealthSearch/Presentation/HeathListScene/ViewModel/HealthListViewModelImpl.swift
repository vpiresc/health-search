import Foundation

@MainActor
class HealthListViewModelImpl: HealthListViewModel {
    @Published var pageTitle: String = ""
    @Published var providersNames: [Provider] = []

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
            providersNames = providerViewModel.data
        } catch {
            throw(NetworkError.unableToLoad)
        }
    }
    
    func searchResults(_ searchText: String) -> [Provider] {
        if searchText.isEmpty { providersNames }
        else { providersNames.filter { $0.contains(text: searchText) }
        }
    }
}

import SwiftUI

struct HealthListView<VM: HealthListViewModel>: View {
    @ObservedObject var viewModel: VM
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(searchResults.enumerated()), id: \.offset) { index, name in
                    Text(name)
                }
            }.task {
                await displayData()
            }
            .navigationTitle(viewModel.pageTitle)
            .listStyle(.plain)
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [String] {
        viewModel.searchResults(searchText)
    }
}

extension HealthListView: HealthListViewModellDisplayLogic {
    func displayData() async {
        do {
            try await viewModel.prepareData()
        } catch {
            print(error)
        }
    }
}

#Preview {
    HealthListViewFactory.make()
}

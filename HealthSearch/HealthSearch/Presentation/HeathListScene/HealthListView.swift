import SwiftUI

struct HealthListView<VM: HealthListViewModel>: View {
    @ObservedObject var viewModel: VM
    @State private var searchText = ""
    private let primaryColor = Color(red: 1.0, green: 0.0, blue: 0.52)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    Text(name)                       .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .bottom)))
                }
            }
            .task {
                await displayData()
            }.animation(.default, value: searchResults)
                .navigationTitle(viewModel.pageTitle)
                .listStyle(.plain)
        }
        .searchable(text: $searchText)
        .accentColor(primaryColor)
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

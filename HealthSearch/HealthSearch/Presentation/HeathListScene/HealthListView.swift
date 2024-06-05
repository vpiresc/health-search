import SwiftUI

struct HealthListView<VM: HealthListViewModel>: View {
    @ObservedObject var viewModel: VM
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    Text(name)
                }
            }
            .navigationTitle("Contacts")
            .listStyle(.plain)
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return viewModel.providersNames
            
        } else {
            return viewModel.providersNames.filter { $0.contains(searchText) }
            
        }
    }
}

//#Preview {
//    HealthListView(viewModel: <#_#>)
//}

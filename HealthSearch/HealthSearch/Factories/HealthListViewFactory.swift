//
//  HealthListViewFactory.swift
//  HealthSearch
//
//  Created by Vitor Pires on 04/06/24.
//

import SwiftUI

struct HealthListViewFactory {
    @MainActor static func make() -> some View {
        let viewModel = HealthListViewModelImpl(service: LocalService())
        let view = HealthListView(viewModel: viewModel)
        return view
    }
    
}

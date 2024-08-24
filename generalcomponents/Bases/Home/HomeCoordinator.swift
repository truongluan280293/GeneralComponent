//
//  HomeCoordinator.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/24/24.
//

import SwiftUI

struct HomeCoordinator: View {
    @State private var homePath = NavigationPath()
    var body: some View {
        NavigationStack(path: $homePath) {
            HomeView()
                .navigationDestination(for: String.self) { value in
                    // TODO: Setup next view
                    EmptyView()
                }
        }
    }
}

#Preview {
    HomeCoordinator()
}

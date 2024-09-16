//
//  AppCoordinator.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/20/24.
//

import SwiftUI

struct AppCoordinator: View {
    var body: some View {
        ZStack {
            AppView()
            AppMessageView()
            AppLoadingView()
        }
        .toolbar(.hidden, for: .navigationBar, .tabBar)
    }
}

#Preview {
    AppCoordinator()
}

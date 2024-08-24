//
//  AppView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/20/24.
//

import SwiftUI
import Combine

struct AppView: View {
    @Environment(AppState.self) private var state
    var body: some View {
        switch state.appPhase {
        case .appView:
            mainApp
        case .splash:
            SplashCoordinator {
                state.appPhase = .appView
            }
        }
    }
    
    @ViewBuilder
    private var mainApp: some View {
        HomeCoordinator()
    }
}

#Preview {
    AppView()
        .environment(AppState())
}

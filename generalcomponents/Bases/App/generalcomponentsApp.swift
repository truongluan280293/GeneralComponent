//
//  generalcomponentsApp.swift
//  generalcomponents
//
//  Created by Truong Luan on 7/23/24.
//

import SwiftUI

@main
struct generalcomponentsApp: App {
    @State private var appState = AppState()
    @State private var appSettings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinator()
                .environment(appState)
                .environment(appSettings)
        }
    }
}

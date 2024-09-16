//
//  AppLoadingView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/22/24.
//

import SwiftUI

struct AppLoadingView: View {
    @State private var showLoading: Bool = false
    
    var body: some View {
        mainContent
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if !showLoading {
            EmptyView()
        } else {
            Text("Hello, App loading View!")
        }
    }
}

#Preview {
    AppLoadingView()
}

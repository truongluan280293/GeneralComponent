//
//  AppMessageView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/22/24.
//

import SwiftUI

struct AppMessageView: View {
    @State private var showMessage: Bool = false
    
    var body: some View {
        mainContent
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if !showMessage {
            EmptyView()
        } else {
            Text("Hello, Message App View!")
        }
    }
}

#Preview {
    AppMessageView()
}

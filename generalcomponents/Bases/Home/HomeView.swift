//
//  HomeView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/24/24.
//

import SwiftUI

struct HomeView: View {
   
    @Environment(AppSettings.self) var appSetting
    private var color: ColorProtocol {
        appSetting.theme.color
    }
    
    var body: some View {
        VStack {
            Button(action: {
                appSetting.theme = ThemeDefault()
            }, label: {
                Text("Theme Default")
            })
            
            Button(action: {
                appSetting.theme = ThemeSeconds()
            }, label: {
                Text("Theme Seconds")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color.secondary)
    }
}

#Preview {
    HomeView()
        .environment(AppSettings())
        .environment(AppState())
}

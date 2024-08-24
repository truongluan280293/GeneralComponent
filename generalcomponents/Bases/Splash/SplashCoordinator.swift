//
//  SplashCoordinator.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/22/24.
//

import SwiftUI

struct SplashCoordinator: View {
    var onAction: (() -> Void)?
    
    var body: some View {
        SplashView(onAction: onAction)
    }
}

#Preview {
    SplashCoordinator()
}

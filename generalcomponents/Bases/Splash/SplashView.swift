//
//  SplashView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/22/24.
//

import SwiftUI

struct SplashView: View {
    var onAction: (() -> Void)?
    var body: some View {
        SampleSplashView(onFinish: onAction)
    }
}

// MARK: - Sample
private extension SplashView {
    struct SampleSplashView: View {
        // MARK: - Required Public
        var onFinish: (() -> Void)?
        init(onFinish: ( () -> Void)? = nil) {
            self.onFinish = onFinish
        }
        
        // MARK: - Private
        @State private var countDown: Int = 3
        var body: some View {
            VStack {
                Text("Welcome")
                Text("\(countDown)")
                    .font(.largeTitle)
            }
            .onAppear(perform: {
                Task {
                    try? await Task.sleep(nanoseconds:.nanoSeconds(s: 1))
                    countDown -= 1
                    try? await Task.sleep(nanoseconds:.nanoSeconds(s: 1))
                    countDown -= 1
                    try? await Task.sleep(nanoseconds:.nanoSeconds(s: 1))
                    countDown -= 1
                    if countDown <= 0 {
                        onFinish?()
                    }
                }
            })
        }
    }
}

#Preview {
    SplashView()
}

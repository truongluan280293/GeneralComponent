//
//  TestPage.swift
//  generalcomponents
//
//  Created by Truong Luan on 7/26/24.
//

import SwiftUI

struct TestPage: View {
    @State var valueSlider: CGFloat = 20
    @State var realValue: Float = 2
    
    @State var valueSlider2: CGFloat = 1
    
    
    @State var age: Float = 2
    @State var weight: Float = 2
    var body: some View {
        VStack {
            HStack {
                Text("Age:")
                Spacer()
            }
            ContentView(value: $realValue, range: 100...250, format: .text("%@ cm"))
            ContentView(value: $age, range: 10...100, format: .plain)
            ContentView(value: $weight, range: 40...200, format: .number("%ld kg"))
        }
        .padding(.horizontal, 10)

    }
}

#Preview {
    TestPage()
}

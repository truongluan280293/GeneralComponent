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
    var body: some View {
        VStack {
            HStack {
                Text("Age:")
                Spacer()
            }
            ContentView(percent: $valueSlider, value: $realValue, range: 10.7...250.2, isRounded: true)
            
//            Slider(value: $valueSlider2, in: 10...100, step: 1) { isedit in
//                
//            }
//            Text("Value slider: \(valueSlider2)")
//            Slider(value: $valueSlider2, in: 0...100.5) {
//                Text("Hello slider")
//            } onEditingChanged: { isEdit in
//                print("value change: \(isEdit)")
//            }

//            Slider(value: $valueSlider2, in: 0...200.5) {
//                Text("Text slider")
//            } minimumValueLabel: {
//                Text("minimum label")
//            } maximumValueLabel: {
//                Text("maximum label")
//            } onEditingChanged: { isedit
//                in
//                print("==>> slider is change: \(isedit)")
//            }
            
            

        }
        .padding(.horizontal, 10)

    }
}

#Preview {
    TestPage()
}

//
//  TabbarView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/26/24.
//

import SwiftUI

// MARK: - TabbarView
struct TabbarView: View {
    var items: [ItemModel] = []
    var onTap: ((String) -> Void)?
    private let height: CGFloat = 50
    
    // MARK: - Entry point
    var body: some View {
        HStack {
            ForEach(items, id: \.id) { item in
                Spacer()
                ItemView(text: item.text) {
                    Image(systemName: item.imgName)
                        .resizable()
                }
                .onTapGesture {
                    onTap?(item.text)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: height, alignment: .bottom)
        .background(.white)
    }
}

// MARK: - ItemView
extension TabbarView {
    struct ItemView<T: View>: View {
        private var size: CGFloat = 20
        
        private var text: String
        private var icon: () -> T

        init(text: String, 
             @ViewBuilder icon: @escaping () -> T = { EmptyView() }) {
            self.text = text
            self.icon = icon
        }
        
        var body: some View {
            VStack(spacing: 6) {
                Color.clear
                    .frame(width: size, height: size)
                    .overlay {
                        icon()
                    }
                Text(text)
                    .font(.system(size: 10))
            }
        }
    }
}

// MARK: - Item Model
extension TabbarView {
    struct ItemModel: Identifiable {
        let id: String = UUID().uuidString
        let text: String
        let imgName: String
    }
}

private extension TabbarView {
    struct Sample: View {
        @State private var tab_5: [ItemModel] = [
            .init(text: "Home", imgName: "square"),
            .init(text: "Rainbow", imgName: "square.on.square"),
            .init(text: "Timelapse", imgName: "square.slash"),
            .init(text: "Wave", imgName: "trash.square"),
            .init(text: "Target", imgName: "command.square")
        ]
        
        @State private var tab_3: [ItemModel] = [
            .init(text: "Home", imgName: "square"),
            .init(text: "Rainbow", imgName: "square.on.square"),
            .init(text: "Timelapse", imgName: "square.slash")
        ]
        
        @State private var tab_2: [ItemModel] = [
            .init(text: "Home", imgName: "square"),
            .init(text: "Rainbow", imgName: "square.on.square")
        ]
        var body: some View {
            VStack {
                TabbarView(items: tab_5) { item in
                    print("==>> tap on: \(item)")
                }
                TabbarView(items: tab_3)
                TabbarView(items: tab_2)
                Button(action: {
                    tab_5.removeLast()
                }, label: {
                    Text("remove")
                })
            }
        }
    }
}
#Preview {
    TabbarView.Sample()
}

//
//  NavView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/25/24.
//

import SwiftUI

// MARK: - NavViewState
@Observable final private class NavViewState {
    var leftItems: [NavView.NavItem] = [.back()]
    var rightItems: [NavView.NavItem] = []
    var onAction: ((String) -> Void)?
}

// MARK: - Entry point - NavView
struct NavView: View {
    var title: String
    @State private var state = NavViewState()
    
    var body: some View {
        HStack {
            leftView
            Text(title)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            rightView
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    @ViewBuilder
    private var leftView: some View {
        ForEach(state.leftItems, id: \.id) { item in
            Group {
                if let sys = item.systemImgName {
                    Image(systemName: sys)
                }
                if let name = item.imgName {
                    Image(name)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
            }
            .onTapGesture {
                state.onAction?(item.tag)
            }
        }
    }
    
    @ViewBuilder
    private var rightView: some View {
        ForEach(state.rightItems, id: \.id) { item in
            Group {
                if let sys = item.systemImgName {
                    Image(systemName: sys)
                }
                if let name = item.imgName {
                    Image(name)
                        .resizable()
                        .frame(width: 18, height: 18)
                }
            }
            .onTapGesture {
                state.onAction?(item.tag)
            }
        }
    }
}

// MARK: - Public function
extension NavView {
    func leftItems(items: [NavItem]) -> Self {
        state.leftItems = items
        return self
    }
    
    func rightItems(items: [NavItem]) -> Self {
        state.rightItems = items
        return self
    }
    
    func onItemAction(handler: @escaping (String) -> Void) -> Self {
        state.onAction = handler
        return self
    }
}

// MARK: - NavItem
extension NavView {
    struct NavItem: Identifiable {
        struct Tags {
            static let back = "back"
            static let search = "search"
        }
        
        let id: String = UUID().uuidString
        var tag: String
        var imgName: String?
        var systemImgName: String?
        
        init(imgName: String, tag: String = "") {
            self.imgName = imgName
            self.systemImgName = nil
            self.tag = tag
        }
        
        init(systemImgName: String, tag: String = "") {
            self.imgName = nil
            self.systemImgName = systemImgName
            self.tag = tag
        }
        
        static func `back`() -> NavItem {
            NavItem(systemImgName: "chevron.backward", tag: NavItem.Tags.back)
        }
        
        static func `search`() -> NavItem {
            NavItem(systemImgName: "magnifyingglass", tag: NavItem.Tags.search)
        }
    }
}

// MARK: - Sample how to use
private extension NavView {
    struct Sample: View {
        
        var body: some View {
            VStack {
                // MARK: - Default Using
                NavView(title: "Navigation Title Default")
                    .onItemAction { tag in
                        print("tap on \(tag)")
                    }
                
                // MARK: - Custom Right Using
                NavView(title: "Navigation right custom")
                    .rightItems(items: [.search()])
                    .onItemAction { tag in
                        print("tap2 on \(tag)")
                    }
                
                // MARK: - Custom Left and Right Using
                NavView(title: "Navigation left right custom")
                    .leftItems(items: [.back(), .back()])
                    .rightItems(items: [.search(), .search()])
            }
        }
    }
}

#Preview {
    NavView.Sample()
}

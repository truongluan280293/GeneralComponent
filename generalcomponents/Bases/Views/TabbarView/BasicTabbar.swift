//
//  BasicTabbar.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/26/24.
//

import SwiftUI

struct BasicTabbar: View {
    @State private var selectTab: Tab = .tab1
    
    var body: some View {
        VStack {
            TabView(selection: $selectTab) {
                // TODO: Replace to real page view like Home_Page_View
                DetailPage(title: Tab.tab1.title,
                           titleCenter: Tab.tab1.titleCenter)
                .tag(Tab.tab1)
                
                // TODO: Replace to real page view like Promotion_Page_View
                DetailPage(title: Tab.tab2.title,
                           titleCenter: Tab.tab2.titleCenter)
                .tag(Tab.tab2)
                
                // TODO: Replace to real page view like Setting_Page_View
                DetailPage(title: Tab.tab3.title,
                           titleCenter: Tab.tab3.titleCenter)
                .tag(Tab.tab3)
            }
            
            TabbarView(items: [
                .init(text: Tab.tab1.title, imgName: Tab.tab1.systemImage),
                .init(text: Tab.tab2.title, imgName: Tab.tab2.systemImage),
                .init(text: Tab.tab3.title, imgName: Tab.tab3.systemImage)
            ]) { tabText in
                switch tabText {
                case "Tab_1":
                    selectTab = .tab1
                case "Tab_2":
                    selectTab = .tab2
                case "Tab_3":
                    selectTab = .tab3
                default: break
                }
            }
        }
    }
}

// MARK: - Tab Page Enum
extension BasicTabbar {
    enum Tab: Hashable, Identifiable {
        var id: Self {
            return self
        }
        
        // TODO: - Replace to real item like Home
        case tab1
        // TODO: - Replace to real item like Promotion
        case tab2
        // TODO: - Replace to real item like Settings
        case tab3
        
        // TODO: - Replace to something
        var title: String {
            switch self {
            case .tab1:
                return "Tab_1"
            case .tab2:
                return "Tab_2"
            case .tab3:
                return "Tab_3"
            }
        }
        
        // TODO: - Replace to something
        var titleCenter: String {
            switch self {
            case .tab1:
                return "Hello tab 1"
            case .tab2:
                return "Hello tab 2"
            case .tab3:
                return "Hello tab 3"
            }
        }
        
        // TODO: - Replace to something
        var systemImage: String {
            switch self {
            case .tab1:
                return "cursorarrow.square"
            case .tab2:
                return "heart.square"
            case .tab3:
                return "star.square"
            }
        }
    }
}

private extension BasicTabbar {
    struct DetailPage: View {
        let title: String
        let titleCenter: String
        
        var body: some View {
            VStack {
                Text(titleCenter)
            }
        }
    }
}

#Preview {
    BasicTabbar()
}

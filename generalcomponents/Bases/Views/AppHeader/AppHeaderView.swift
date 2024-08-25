//
//  AppHeaderView.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/25/24.
//

import SwiftUI

struct AppHeaderView: View {
    var onAction: ((ActionType) -> Void)?
    var body: some View {
        Sample(onAction: onAction)
    }
}

extension AppHeaderView {
    enum ActionType {
        case left
        case right
    }
}

extension AppHeaderView {
    struct Sample: View {
        var onAction: ((ActionType) -> Void)?
        var body: some View {
            HStack {
                Image(systemName: "pencil.and.scribble")
                    .onTapGesture {
                        onAction?(.left)
                    }
                Spacer()
                Text("My template project app")
                Image(systemName: "book.pages")
                    .onTapGesture {
                        onAction?(.right)
                    }
            }
            .padding()
            .background(.quaternary)
        }
    }
}

#Preview {
    AppHeaderView()
}

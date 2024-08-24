//
//  Constants.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/22/24.
//

import Foundation

typealias AppPhase = Constants.App.AppPhase

// MARK: - Constants
struct Constants { }

// MARK: - App
extension Constants {
    struct App {
        enum AppPhase {
            case splash
            case appView
        }
    }
}

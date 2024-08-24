//
//  UInt64.swift
//  generalcomponents
//
//  Created by Truong Luan on 8/24/24.
//

import Foundation

// MARK: - Nano Seconds
extension UInt64 {
    static func nanoSeconds(s: TimeInterval) -> UInt64 {
        return UInt64(s * 1_000_000_000)
    }
}

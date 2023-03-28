//
//  TypeModels.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import Foundation

enum Activity: CaseIterable {
    case none
    case low
    case medium
    case high
    
    var title: String {
        switch self {
        case .none:
            return Localizable.activityNone()
        case .low:
            return Localizable.activityLow()
        case .medium:
            return Localizable.activityMedium()
        case .high:
            return Localizable.activityHigh()
        }
    }
    var value: Double {
        switch self {
        case .none:
            return 0
        case .low:
            return 50
        case .medium:
            return 150
        case .high:
            return 250
        }
    }
}

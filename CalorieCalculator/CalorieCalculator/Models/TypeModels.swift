//
//  TypeModels.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import Foundation

enum Activity {
    case none
    case low
    case medium
    case high
    
    var title: String {
        switch self {
        case .none:
            return R.string.localizable.activityNone()
        case .low:
            return R.string.localizable.activityLow()
        case .medium:
            return R.string.localizable.activityMedium()
        case .high:
            return R.string.localizable.activityHigh()
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

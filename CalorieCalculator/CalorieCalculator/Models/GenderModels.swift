//
//  GenderModels.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import Foundation

enum Gender: Int {
    // 0 and 1 are working like this by default. You can remove explicit 0 and 1 defining
    case male = 0
    case female = 1

    var title: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return  "Female"
        }
    }
}

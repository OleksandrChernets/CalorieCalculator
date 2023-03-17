//
//  GenderModels.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import Foundation


enum Gender: Int {
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

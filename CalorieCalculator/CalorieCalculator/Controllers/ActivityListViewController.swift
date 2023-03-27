//
//  ActivityListViewController.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import UIKit

class ActivityListViewController: UIViewController {
    // You should add "MARK:" your entities all, not only one of them. Or don't mark at all
    
    @IBOutlet weak var detailLabel: UILabel!

     var activity: Activity?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Not localized strings
        if let activity = activity {
            detailLabel.text = "Activity: \(activity.title) with \(activity.value) calories"
        } else {
            detailLabel.text = "No selected activity"
        }
    }
}

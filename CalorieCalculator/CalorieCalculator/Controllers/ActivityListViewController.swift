//
//  ActivityListViewController.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import UIKit

final class ActivityListViewController: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet private weak var detailLabel: UILabel!

    //MARK: Properties
     var activity: Activity?

    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if let activity = activity {
            detailLabel.text = "Activity: \(activity.title) with \(activity.value) calories"
        } else {
            detailLabel.text = "No selected activity"
        }
    }
}

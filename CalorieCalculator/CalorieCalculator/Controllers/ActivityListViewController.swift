//
//  ActivityListViewController.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import UIKit

class ActivityListViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
     var activity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let activity = activity {
            detailLabel.text = "Activity: \(activity.title) with \(activity.value) calories"
        } else {
            detailLabel.text = "No selected activity"
        }
    }
    

    
}

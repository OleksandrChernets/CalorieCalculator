//
//  ViewController.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton! {
        didSet {
            calculateButton.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var clearButton: UIButton! {
        didSet {
            clearButton.layer.cornerRadius = 20
        }
    }
    
    private let pickerView = UIPickerView()
    private let activity = ["None", "Low", "Medium", "High"]
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    // MARK: Lifecykl method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSegmentControl()
        configureTextField()
        configureActivityField()
    }
    
    // MARK: @IBActions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
    }
    
    func configureSegmentControl() {
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: "Male", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "Female", at: 1, animated: false)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.layer.cornerRadius = 15
    }
    
    func configureTextField() {
        weightTextField.delegate = self
        weightTextField.keyboardType = .numberPad
        weightTextField.becomeFirstResponder()
        heightTextField.delegate = self
        heightTextField.keyboardType = .numberPad
        ageTextField.delegate = self
        ageTextField.keyboardType = .numberPad
    }
    
    func configureActivityField() {
        pickerView.delegate = self
        pickerView.dataSource = self
        activityTextField.inputView = pickerView
        activitySelectBy(row: 0)
    }
    
    func activitySelectBy(row: Int) {
        activityTextField.text = activity[row]
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
}

extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activity.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activitySelectBy(row: row)
    }
}

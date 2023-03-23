//
//  ViewController.swift
//  CalorieCalculator
//
//  Created by Alexandr Chernets on 17.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: @IBOutlets
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
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
    
    // MARK: Properties
    
    private let pickerView = UIPickerView()
    private let activities = [Activity.none, Activity.low, Activity.medium, Activity.high]
    
    // MARK: Lifecycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSegmentControl()
        configureTextField()
        configureActivityField()
        localizeUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let activityController = segue.destination as? ActivityListViewController {
                let activityIndex = self.pickerView.selectedRow(inComponent: 0)
                let activity = self.activities[activityIndex]
                activityController.activity = activity
            }
        }
    }
    
    // MARK: @IBActions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        guard let weight = Double(weightTextField.text ?? ""),
              let height = Double(heightTextField.text ?? ""),
              let age = Double(ageTextField.text ?? ""),
              weight > 0 && height > 0 && age > 0 else { return }
        
        let activityIndex = pickerView.selectedRow(inComponent: 0)
        let activity = activities[activityIndex]
        let activityValue = activity.value
        
        guard let selectedGender = Gender(rawValue: segmentControl.selectedSegmentIndex) else { return }
        switch selectedGender {
        case .male:
            let result = 10 * weight + 6.25 * height - 5 * age + 5 + activityValue
            showAlert(with: String(result))
        case .female:
            let result = 8 * weight + 5.25 * height - 5 * age + 5 - 161 + activityValue
            showAlert(with: String(result))
        }
    }
    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
        clear()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clear()
    }
    
    // MARK: Public methods
    
    public func showAlert(with title: String) {
        let alert = UIAlertController(title: R.string.localizable.alertResult(), message: title, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .cancel))
        alert.addAction(.init(title: R.string.localizable.alertShowDetail(), style: .default) { _ in
            
            self.performSegue(withIdentifier: "segue", sender: self)
        })
        self.present(alert, animated: true)
    }
    
    public func clear() {
        weightTextField.text = nil
        heightTextField.text = nil
        ageTextField.text =  nil
        activitySelectBy(row: 0)
        weightTextField.becomeFirstResponder()
        pickerView.selectRow(0, inComponent: 0, animated: true)
        activitySelectBy(row: 0)
        
    }
    public func configureSegmentControl() {
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: R.string.localizable.genderMale(), at: 0, animated: false)
        segmentControl.insertSegment(withTitle: R.string.localizable.genderFamele(), at: 1, animated: false)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.layer.cornerRadius = 15
    }
    
    public func configureTextField() {
        weightTextField.delegate = self
        weightTextField.keyboardType = .numberPad
        weightTextField.becomeFirstResponder()
        heightTextField.delegate = self
        heightTextField.keyboardType = .numberPad
        ageTextField.delegate = self
        ageTextField.keyboardType = .numberPad
    }
    
    public func configureActivityField() {
        pickerView.delegate = self
        pickerView.dataSource = self
        activityTextField.inputView = pickerView
        activitySelectBy(row: 0)
    }
    
    public func activitySelectBy(row: Int) {
        activityTextField.text = activities[row].title
    }
    
    public func localizeUI() {
        weightLabel.text = R.string.localizable.calculatorWeightLabel()
        heightLabel.text = R.string.localizable.calculatorHeightLabel()
        ageLabel.text = R.string.localizable.calculatorAgeLabel()
        activityLabel.text = R.string.localizable.calculatorActivityLabel()
        calculateButton.setTitle(R.string.localizable.calculatorCalculateButton(), for: .normal)
        clearButton.setTitle(R.string.localizable.calculatorClearButton(), for: .normal)
        
    }
}

// MARK: UITextFieldDelegate

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
}

// MARK: UIPickerViewDataSource && UIPickerViewDelegate

extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activities[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activitySelectBy(row: row)
    }
}

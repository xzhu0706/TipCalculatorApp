//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Xiaohong Zhu on 8/5/18.
//  Copyright © 2018 Xiaohong Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var splitControl: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update tip percentage to its default
        let defaultTipPercent = defaults.integer(forKey: "myDefaultTip")
        tipControl.setValue(Float(defaultTipPercent), animated: true)
        tipPercentLabel.text = "\(defaultTipPercent)%"
        
        // Update theme to its default
        let defaultTheme = defaults.integer(forKey: "myDefaultTheme")
        if (defaultTheme == 0) {
            self.view.backgroundColor = UIColor(red:0.90, green:1.00, blue:0.96, alpha:1.0)
        } else {
            self.view.backgroundColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        }
        
        // Display currency symbol in the text field before entering amount
        billField.placeholder = Locale.current.currencySymbol
        
        // Load bill from previous input
        billField.text = defaults.string(forKey: "myBill")
        
        // Calculate tip
        calculateTip(self)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentage = Double(Int(tipControl.value)) * 0.01
        let split = Int(splitControl.value)
        let tip = bill * tipPercentage
        let total = bill + tip
        let splitTotal = total / Double(split)
        
        // Set format of locale currency
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        // Update the labels
        tipPercentLabel.text = "\(Int(tipControl.value))%"
        splitNumberLabel.text = "\(split)"
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
        splitLabel.text = formatter.string(from: NSNumber(value: splitTotal))
        
        // Save bill to remember
        defaults.set(billField.text, forKey: "myBill")
        defaults.synchronize()
    }
    
    @IBAction func onTap(_ sender: Any) {
        // Close the decimal pad
        view.endEditing(true)
    }
    
}

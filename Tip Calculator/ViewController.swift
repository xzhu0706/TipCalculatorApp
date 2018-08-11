//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Xiaohong Zhu on 8/5/18.
//  Copyright © 2018 Xiaohong Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // update tip percentage to its default
        let defaults = UserDefaults.standard
        let defaultTipPercent = defaults.integer(forKey: "myDefaultTip")
        tipControl.setValue(Float(defaultTipPercent), animated: true)
        tipPercentLabel.text = "\(defaultTipPercent)%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentage = Double(Int(tipControl.value)) * 0.01
        let split = Int(splitControl.value)
        tipPercentLabel.text = "\(Int(tipControl.value))%"
        splitNumberLabel.text = "\(split)"
        let tip = bill * tipPercentage
        let total = bill + tip
        let splitTotal = total / Double(split)
        tipLabel.text = String(format:"%.2f", tip)
        totalLabel.text = String(format:"%.2f", total)
        splitLabel.text = String(format:"%.2f", splitTotal)
        
    }
    
    

}


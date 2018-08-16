//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Xiaohong Zhu on 8/10/18.
//  Copyright © 2018 Xiaohong Zhu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var defaultControl: UISlider!
    @IBOutlet weak var themeControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Load default tip percentange
        let defaults = UserDefaults.standard
        let defaultTipPercent = defaults.integer(forKey: "myDefaultTip")
        defaultControl.setValue(Float(defaultTipPercent), animated: true)
        defaultLabel.text = "\(defaultTipPercent)%"
        
        // Load default theme
        let defaultTheme = defaults.integer(forKey: "myDefaultTheme")
        themeControl.selectedSegmentIndex = defaultTheme
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultChanged(_ sender: Any) {
        let defaultTip = Int(defaultControl.value)
        
        // Update label
        defaultLabel.text = "\(defaultTip)%"
        
        // Set default tip percentage
        defaults.set(defaultTip, forKey: "myDefaultTip")
        defaults.synchronize()
    }
    
    @IBAction func changeTheme(_ sender: Any) {
        let defaultTheme = themeControl.selectedSegmentIndex
        defaults.set(defaultTheme, forKey: "myDefaultTheme")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//
//  ViewController.swift
//  TipCalculatorTPM
//
//  Created by Pranaya Adhikari on 7/5/18.
//  Copyright © 2018 Pranaya Adhikari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    let defaults = UserDefaults.standard
    let tipPercentages = [0.18,0.2,0.25]
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text =  String(format: "$%.2f", total)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        //view.backgroundColor = UIColor.green
       
        if let value = defaults.value(forKey: "defaultTip"){
            let selectedIndex = value as! Int
            tipControl.selectedSegmentIndex = selectedIndex
        }
        
        if let valueColor = defaults.value(forKey: "themeChosen"){
           let selectedColor = valueColor as! Int
            if (selectedColor == 0){
                view.backgroundColor = UIColor.darkGray
            } else if(selectedColor==1){
                view.backgroundColor = UIColor.white
            }
            
        }
        
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        defaults.set(0, forKey: "defaultTip")
        barButtonItem.isEnabled = false
        barButtonItem.isEnabled = true
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    
    
}


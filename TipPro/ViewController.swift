//
//  ViewController.swift
//  TipPro
//
//  Created by Andrew Tsukuda on 8/19/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    
    // Make the Status Bar icons (i.e. Carrier status and clock) White instead of black
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /* This makes it so that the keyboard goes away when the user touches outsicde of the keyboard or text field*/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        /* Check that billAmount is filled in */
        if let billAmount = Double(billAmountField.text!) {
            
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100 * tipAmount) / 100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if(!billAmountField.isEditing) {
                billAmountField.text = String(format: "%.2f", roundedBillAmount)
            }
            
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
            
            
        } else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipSelector.addTarget(self, action: #selector(calculateTip(_:)), for: .valueChanged)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  TipWell
//
//  Created by Renn Jervis on 3/21/15.
//  Copyright (c) 2015 Renn Jervis. All rights reserved.
//
import WatchKit
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var TipTotal: UISegmentedControl!
    @IBOutlet weak var tipVal: UISegmentedControl!
    
    @IBOutlet weak var results: UITextField!
    
    @IBAction func endBillEdit(sender: AnyObject) {
        billAmount.resignFirstResponder()
    }
    
    @IBAction func sliderValueChanged(sender:AnyObject! ) {
        
        endBillEdit(self)
        sliderValue.text = "\(taxSlider.value)%"
    }
    func getTip()->Double{
        var tip = 0.0
        if tipVal.selectedSegmentIndex == 0 {
            tip = 0.15 }
        else if tipVal.selectedSegmentIndex == 1 {
            tip = 0.175
        }
        else if tipVal.selectedSegmentIndex == 2 {
            tip = 0.20
        }
        return tip
    }
    
    @IBAction func calculate(sender: AnyObject) {
        
        //get necessary values
        var tipPer = getTip()
        var bill=((billAmount.text as NSString).doubleValue)
        let tax = taxSlider.value/100
        let myCalc = TipCalculator(bill: bill, tax: tax, tip:tipPer)
        myCalc.tipPer = tipPer
        let tipVal = myCalc.calculateTip(bill, tax: tax, tipPer: tipPer)
        let total = myCalc.calculateTotal(bill, tax: tax, tipPer: tipPer)
        
        // determine which to calculate
        
            if TipTotal.selectedSegmentIndex == 0 { //return tip
                results.text = " \(tipVal)" }
            else if TipTotal.selectedSegmentIndex == 1{
                results.text = "\(total))"
                }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


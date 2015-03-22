//
//  TipCalculator.swift
//  TipWell
//
//  Created by Renn Jervis on 3/21/15.
//  Copyright (c) 2015 Renn Jervis. All rights reserved.
//

import Foundation

class TipCalculator{
    var bill_amount:Double
    var tax_amount:Float
    var tipPer:Double
    
    init (bill:Double, tax:Float, tip:Double){
        self.bill_amount = bill
        self.tax_amount = tax
        self.tipPer = tip
    }
    
    func calculateTip(bill:Double, tax:Float, tipPer:Double)->Double{
        
        return bill*tipPer
    }
    
    func calculateTotal(bill:Double, tax:Float, tipPer:Double)->Double{
        let tip = calculateTip(bill, tax: tax, tipPer: tipPer)
        let tax1 = bill*Double(tax)
        return bill+tip+tax1
    }
}

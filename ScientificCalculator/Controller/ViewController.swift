//
//  ViewController.swift
//  ScientificCalculator
//
//  Created by Ridhi Joshi on 8/23/20.
//  Copyright © 2020 Ridhi Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!  //connects IBOutlet with display label.
     private var isFinishedTypingNumber: Bool = true //keeping it private so that members from other class cannot access it.
    private var displayValue: Double {      //displays output in double format
           get {
               guard let number = Double(displayLabel.text!) else {
                   fatalError("Cannot convert display label text to a Double.")
               }
               return number
           }
           set {
               displayLabel.text = String(newValue)
           }
    }
    
    
      private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {  //Provides action to operation buttons
        
              isFinishedTypingNumber = true
              calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
        
                   if let result = calculator.calculate(symbol: calcMethod) {
                       displayValue = result
                   }
               }
        
        
    }
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) { //provides action to buttons with numeric values
        
        if let numValue = sender.currentTitle{
            
            if isFinishedTypingNumber {
            displayLabel.text = numValue
                isFinishedTypingNumber = false
            }
            
            else{
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                    
                }
                displayLabel.text = displayLabel.text! + numValue //appends a value to existing input
            }
            
        }
        
        
    }

    
    


}

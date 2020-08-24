//
//  CalculatorLogic.swift
//  ScientificCalculator
//
//  Created by Ridhi Joshi on 8/23/20.
//  Copyright © 2020 Ridhi Joshi. All rights reserved.
//

import Foundation
import Darwin  //import Darwin to access trignometric functions
import UIKit
struct CalculatorLogic {
    
    private var number: Double?
    
    func sindegrees(degrees:Double)->Double{  // function to obtain sine value
        
        return sin(degrees * M_PI / 180.0)
    }
    
    func cosdegrees(degrees:Double)->Double{ // function to obtain cosine value
        
        return cos(degrees * M_PI / 180.0)
    }
    
    func tandegrees(degrees:Double)->Double{ // function to obtain tangent values
        
        return tan(degrees * M_PI / 180.0)
    }

    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? { //function for operating symbols to add logic to code
       
        if let n = number {
            switch symbol {
            case "±":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            case "Sin":
                    return sindegrees(degrees: n) //returns sindegrees function
            case "Cos":
                    return cosdegrees(degrees: n) //returns cosdegrees function
            case "Tan":
                    return tandegrees(degrees: n)
                case "Sec":
                    return 1/tandegrees(degrees: n) //returns tandegrees function
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? { //function for performing action on numeric values
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2 //returns value for addition
            case "-":
                return n1 - n2 //returns value for subtraction
            case "X":
                return n1 * n2 // returns value for multiplication
            case "÷":
                return n1 / n2 //returns value for division
             case "AC":
                return 0
            case "√":
                return sqrt(n2) //returns square root of a number
            
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    
   
    
}



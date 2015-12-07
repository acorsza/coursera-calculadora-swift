//
//  ViewController.swift
//  Calculadora
//
//  Created by Aderlei Filho on 12/4/15.
//  Copyright © 2015 Aderlei Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // @IBOutlet is not part of Swift syntax
    @IBOutlet weak var display: UILabel!
    
    // Everytime we initialize a variable we don't need to specify its type
    // Let Swift infer from the initialized value instead
    // var userIsInTheMiddleOfTypingANumber: Bool = false
    var userIsInTheMiddleOfTypingANumber = false
    var operandStack = Array<Double>()
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }

    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func enter() {
        
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
        
    }
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×" : performOperation { $0 * $1 }
        case "÷" : performOperation { $1 / $0 }
        case "+" : performOperation { $0 + $1 }
        case "−" : performOperation { $1 - $0 }
        case "√" : performOperation { sqrt($0) }
        default: break
        }
    }
    
    private func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
}


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
    
    var userIsInTheMiddleOfTypingANumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
}


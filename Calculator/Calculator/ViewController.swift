//
//  ViewController.swift
//  Calculator
//
//  Created by Christophe Hoste on 19.03.17.
//  Copyright © 2017 Chris. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isInTheMiddleOfTyping = false
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if(isInTheMiddleOfTyping){
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else{
            display.text = digit
            isInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func floatingPoint(_ sender: UIButton) {
        if !isInTheMiddleOfTyping {
            display.text = "0."
        } else
            if display.text?.range(of: ".") == nil {
                display.text = display.text! + "."
        }
        isInTheMiddleOfTyping = true
        
    }
    
    
    var displayValue:Double {
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if isInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            isInTheMiddleOfTyping = false
        }
        isInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result{
            displayValue = result
        }
    }
    
}


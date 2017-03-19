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
    
    var displayValue:Double {
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
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
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        isInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
}


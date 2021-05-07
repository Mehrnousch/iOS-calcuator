//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by mehrnoush abdinian on 25.04.21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private lazy var numberOnScreen : Double = 0
    private lazy var previousNumber : Double = 0
    private lazy var performingMath = false
    private lazy var finishCalculation = false
    private lazy var operation = 0
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if finishCalculation {
            label.text = ""
        }
        
        if performingMath {
            
            label.text = String( sender.tag - 1)
            
            guard let updatedText = label.text else { return }
            guard let number = Double(updatedText) else { return }
            numberOnScreen = number
            performingMath = false
        }
        else
        {
            guard let text = label.text else { return }
            label.text = text + String( sender.tag - 1)
            
            guard let updatedText = label.text else { return }
            guard let number = Double(updatedText) else { return }
            numberOnScreen = number
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        setOperations(sender: sender)
    }
    
    
}

// MARK: - Methods
extension CalculatorViewController {
    
    
    private func setOperations(sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17
        {
            guard let text = label.text else { return }
            guard let number = Double(text) else { return }
            
            previousNumber = number
            if sender.tag == 12 //Divide
            {
                label.text = "/"
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "*"
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-"
            }else if sender.tag == 15 //Plus
            {
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
            
        }
        else if sender.tag == 16 {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            finishCalculation = true
        }
        else if sender.tag == 17 {
            label.text = ""
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
}

// MARK: - Life cycle methods

extension CalculatorViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


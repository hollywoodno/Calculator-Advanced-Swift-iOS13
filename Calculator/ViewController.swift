//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var displayLabel: UILabel!
  
  private var isFinishedTypingNumbers = true
  private var calculatorLogic = CalculatorLogic()
  
  // MARK: - Methods
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    isFinishedTypingNumbers = true
    
    if let operation = sender.currentTitle {
      
      // ensure enter value can be converted to double
      
      guard let displayTextAsNum = Double(displayLabel.text!) else {
        fatalError("Cannot convert display label text into a number")
      }
      
      // perform the calculation
      calculatorLogic.setNum(displayTextAsNum)
      
      guard let number = calculatorLogic.perform(operation) else {
        fatalError("Cannot perform calculation on operation. Operation returns nil")
      }
      
      displayLabel.text = String(number)
    }
  }
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    if let numString = sender.currentTitle {
      
      if isFinishedTypingNumbers {
        // starting a new number
        isFinishedTypingNumbers = false
        displayLabel.text = numString
      } else {
        
        guard let number = Double(displayLabel.text!) else {
          fatalError("Cannot convert display label text into a number")
        }
        
        // The current number is round down to make it an integer
        // If the rounded down number matches the number not rounded down
        // then we know it's an int, otherwise it must be a decimal
        // Example number is 6.5. Floored it's 6, so 6 is not 6.5 so the
        // number must already have a decimal
        
        // If number is an int, we allow using the dot otherwise it's ignored
        
        if numString == "." {
          if String(number).last == "." {
            return
          }
          
          let isInt = floor(number) == number
          
          if !isInt {
            return
          }
        }
        
        displayLabel.text = displayLabel.text! + numString
      }
    }
  }
}


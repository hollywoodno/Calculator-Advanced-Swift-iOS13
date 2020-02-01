//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var displayLabel: UILabel!
  
  private var isFinishedTypingNumbers = true
  
  @IBAction func calcButtonPressed(_ sender: UIButton) {
    isFinishedTypingNumbers = true
  }
  
  @IBAction func numButtonPressed(_ sender: UIButton) {
    if let numString = sender.currentTitle {
      
      if isFinishedTypingNumbers {
        // starting a new number
        isFinishedTypingNumbers = false
        displayLabel.text = numString
      } else {
        displayLabel.text = displayLabel.text! + numString
      }
      
    }
  }
  
}


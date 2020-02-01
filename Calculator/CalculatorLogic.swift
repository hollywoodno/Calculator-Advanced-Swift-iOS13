//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by hollywoodno on 1/31/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
  
  private var num: Double?
  
  mutating func setNum(_ num: Double) {
    self.num = num
  }
  
  func perform(_ operation: String) -> Double? {
    
    if let num = num {
      switch operation {
      case "+/-":
        print("returning decimal")
        return num * -1
      case "AC":
        print("returning 0")
        return 0
      case "%":
        print("returning percentage")
        return num / 100
      default:
        print("returning nil")
        return nil
      }
    }
    return nil
  }
}

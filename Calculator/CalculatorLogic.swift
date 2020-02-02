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
  private var intermediateCalculation: (calcType: String, n1: Double)?
  
  mutating func setNum(_ num: Double) {
    self.num = num
  }
  
  mutating func perform(_ operation: String) -> Double? {
    if let num = num {
      switch operation {
      case "AC":
        // reset number and intermediate calculation
        setNum(0)
        intermediateCalculation = nil
        return 0
      case "%":
        return num / 100
      case "+/-":
        return num * -1
      case "=":
        return performIntermediateCalculation(by: num)
      default:
         intermediateCalculation = (calcType: operation, n1: num)
      }
    }
    
    return nil
  }
  
  private func performIntermediateCalculation(by n2: Double) -> Double? {
    
    //    guard intermediateCalculation != nil else {
    //      fatalError("Cannot perform calculation. Itermediate calculation cannot be nil")
    //    }
    
    if let intermediateCalculation = intermediateCalculation {
      // safe to force unwrap because these values are not optional in intermediateCalculation
      // however optional chaining with if statements will work as well
      let n1 = intermediateCalculation.n1
      let operation = intermediateCalculation.calcType
      
      switch operation {
      case "+":
        return n1 + n2
      case "-":
        return n1 - n2
      case "÷":
        return n1 / n2
      case "×":
        return n1 * n2
      default:
        fatalError("Operation is invalid.")
      }
    }
    return nil
  }
}

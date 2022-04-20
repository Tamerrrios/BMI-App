//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Temur Juraev on 19.04.2022.
//

import Foundation
import UIKit


struct CalculateBrain {
    
    var bmi: BMI?
    
    
    func getBMIValue() -> String {
        let bmiToString = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToString
}
    func getAdvice() -> String {
        bmi?.advice ?? "Eror"
}
    
    func getColor() -> UIColor {
        bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float, weight: Float)  {
        let bmiResult = weight / pow(height, 2)
        
        if bmiResult < 18.5 {
            bmi = BMI(value: bmiResult, advice: "Eat more pies!", color: .systemBlue)
        } else if  bmiResult < 24.9 {
            bmi = BMI(value: bmiResult, advice: "Fit as a fiddle!", color: .systemGreen)
        } else {
            bmi = BMI(value: bmiResult, advice: "Eat less pies!", color: .systemRed)
        }

}
    

}

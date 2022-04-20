//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Temur Juraev on 19.04.2022.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    var calculateBrain = CalculateBrain()
    
    @IBOutlet var heightNumber: UILabel!
    @IBOutlet var weightNumber: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightNumber.text = String(format: "%.2f", sender.value) + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightNumber.text = String(format: "%.0f", sender.value) + "kg"
    }
    
    
    @IBAction func calculatesPressed(_ sender: UIButton)  {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculateBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()

        }
    }
    
}


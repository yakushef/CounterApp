//
//  ViewController.swift
//  Counter
//
//  Created by Aleksey Yakushev on 12.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var resultLabel: UILabel!
    
    @IBOutlet weak private var incrementButton: UIButton!
    
    @IBOutlet weak private var resetButton: UIButton!
    
    private var counterValue:Int = 0
    
    private func updateUI() {
        let labelText = NSMutableAttributedString(string: "Значение счётчика:\n")
        let boltTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 64)]
        let boldLabelText = NSMutableAttributedString(string: "\(counterValue)", attributes: boltTextAttributes)
        labelText.append(boldLabelText)
        resultLabel.attributedText = labelText
        
        if counterValue == 0 {
            resetButton.isEnabled = false
        } else {
            resetButton.isEnabled = true
        }
    }
    
    private func incrementCounter() {
        counterValue += 1
        updateUI()
    }
    
    private func resetCounter() {
        counterValue = 0
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementButton.layer.cornerRadius = incrementButton.frame.height / 2
        updateUI()
    }

    @IBAction private func incrementButtonTapped() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
        incrementCounter()
    }
    
    @IBAction private func resetButtonTapped() {
        resetCounter()
    }
    
    

}


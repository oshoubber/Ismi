//
//  ViewController.swift
//  Ismi
//
//  Created by Osama on 7/6/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import UIKit

class InsertNameViewController: UIViewController, CAAnimationDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var predictButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    // MARK: View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        predictButton.layer.borderColor = UIColor.white.cgColor
        nameTextField.delegate = self
        createGradient()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateGradient()
    }
    
    
    // MARK: Gradient Methods
    
    func createGradient() {
        let gradientOne = UIColor(red: 0.247, green: 0.369, blue: 0.984, alpha: 1).cgColor // blue
        let gradientTwo = UIColor(red: 0.451, green: 0.012, blue: 0.653, alpha: 1).cgColor // purple
        let gradientThree = UIColor(red: 0.988, green: 0.1, blue: 0.1, alpha: 1).cgColor // red
        
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
        
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func animateGradient() {
        currentGradient = currentGradient < gradientSet.count - 1 ? currentGradient + 1 : 0
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.delegate = self
        gradientChangeAnimation.duration = 4.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
    
    // MARK: Outlet Class Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


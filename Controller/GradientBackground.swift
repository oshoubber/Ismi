//
//  GradientBackground.swift
//  Ismi
//
//  Created by Osama on 7/10/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import Foundation
import UIKit

class GradientBackground: NSObject, CAAnimationDelegate {
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    func getGradientSet() -> [[CGColor]] {
        
        let gradientOne = UIColor(red: 0.247, green: 0.369, blue: 0.984, alpha: 1).cgColor // blue
        let gradientTwo = UIColor(red: 0.451, green: 0.012, blue: 0.653, alpha: 1).cgColor // purple
        let gradientThree = UIColor(red: 0.988, green: 0.1, blue: 0.1, alpha: 1).cgColor // red
        
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
        
        return gradientSet
    
    }
    
    func createGradient() -> CAGradientLayer {
    
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        
        return gradient
    }
    
    func getGradientAnimation() -> CAAnimation {
        currentGradient = currentGradient < gradientSet.count - 1 ? currentGradient + 1 : 0
         
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.delegate = self
        gradientChangeAnimation.duration = 3.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
        
        return gradientChangeAnimation
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
         if flag {
             gradient.colors = gradientSet[currentGradient]
             let _ = getGradientAnimation()
         }
     }
    
}

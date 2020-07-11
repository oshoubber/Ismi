//
//  ResultViewController.swift
//  Ismi
//
//  Created by Osama on 7/6/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tryDifferentButton: UIButton!
    @IBOutlet weak var tryRandomButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    
    var result: [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonDesign()
        setLabels()
    }
    
    @IBAction func tryDifferentName(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setButtonDesign() {
        tryDifferentButton.layer.borderColor = UIColor.systemBlue.cgColor
        tryRandomButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    
    func setLabels() {
        nameLabel.text = result!["name"] as? String
        genderLabel.text = "a \(result!["gender"] ?? "") with \(result!["genderProbability"] ?? "") probability"
        ageLabel.text = "\(result!["age"] ?? "") years old"
        nationalityLabel.text = "and of \(checkCountries()) ancestry."
    }
    
    func checkCountries() -> [String]{
        let countries = result?["countries"]! as! [String:Double]
        let countryNames = Array(countries.keys)
        
        return countryNames == [] ? ["Unknown"] : countryNames
    }
    
}

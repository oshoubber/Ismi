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
    
    var result: [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonDesign()
        nameLabel.text = result!["name"]
    }
    
    @IBAction func tryDifferentName(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setButtonDesign() {
        tryDifferentButton.layer.borderColor = UIColor.systemBlue.cgColor
        tryRandomButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
}

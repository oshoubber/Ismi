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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tryDifferentButton.layer.borderColor = UIColor.systemBlue.cgColor
        tryRandomButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}
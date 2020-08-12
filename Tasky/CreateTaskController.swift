//
//  CreateTaskController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 06/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import Foundation
import UIKit

class CreateTaskController: UIViewController {
    
    
    @IBOutlet weak var buttonCreate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // corner radius untuk button 'done'
        buttonCreate.layer.cornerRadius = 10
        // shadow untuk button 'done'
        buttonCreate.layer.shadowColor = UIColor.black.cgColor
        buttonCreate.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonCreate.layer.shadowOpacity = 0.3
        buttonCreate.layer.shadowRadius = 4.0
    }
    @IBAction func createTask(_ sender: Any) {
        
    }
}

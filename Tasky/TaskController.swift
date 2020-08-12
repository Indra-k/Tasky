//
//  TaskController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 30/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import Foundation
import UIKit

class TaskController: UIViewController {
    
    @IBOutlet weak var buttonCreateTask: UIButton!
    @IBOutlet weak var buttonGetTask: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // corner radius untuk button 'create task'
        buttonGetTask.layer.cornerRadius = 10
        // shadow untuk button 'create task'
        buttonGetTask.layer.shadowColor = UIColor.black.cgColor
        buttonGetTask.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonGetTask.layer.shadowOpacity = 0.3
        buttonGetTask.layer.shadowRadius = 4.0
        
        // corner radius untuk button 'get task'
        buttonCreateTask.layer.cornerRadius = 10
        // shadow untuk button 'get task'
        buttonCreateTask.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonCreateTask.layer.shadowOpacity = 0.3
        buttonCreateTask.layer.shadowRadius = 4.0
    }
    @IBAction func createTask(_ sender: Any) {
        
        dismiss(animated: true)
    }
    @IBAction func getTask(_ sender: Any) {
        
        dismiss(animated: true)
    }
}

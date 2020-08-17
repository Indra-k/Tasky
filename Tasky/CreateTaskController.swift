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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // corner radius untuk button 'done'
        buttonCreate.layer.cornerRadius = 10
        // shadow untuk button 'done'
        buttonCreate.layer.shadowColor = UIColor.black.cgColor
        buttonCreate.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonCreate.layer.shadowOpacity = 0.3
        buttonCreate.layer.shadowRadius = 4.0
        
        accessibility()
    }
    @IBAction func createTask(_ sender: Any) {
        
    }
}

extension CreateTaskController {
func accessibility() {
    titleLabel.font = .preferredFont(forTextStyle: .headline)
    titleLabel.adjustsFontForContentSizeCategory = true
    taskTitle.font = .preferredFont(forTextStyle: .subheadline)
    taskTitle.adjustsFontForContentSizeCategory = true
    roleLabel.font = .preferredFont(forTextStyle: .subheadline)
    roleLabel.adjustsFontForContentSizeCategory = true
    stageLabel.font = .preferredFont(forTextStyle: .subheadline)
    stageLabel.adjustsFontForContentSizeCategory = true
    descriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
    descriptionLabel.adjustsFontForContentSizeCategory = true
    buttonCreate.titleLabel?.font = .preferredFont(forTextStyle: .headline)
    buttonCreate.titleLabel?.adjustsFontForContentSizeCategory = true
}
}

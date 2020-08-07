//
//  InsertTaskViewController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 07/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class InsertTaskViewController: UIViewController {

    @IBOutlet weak var titlePopup: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonInsert: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func insertIdButton(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}

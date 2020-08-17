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
        
        // corner radius untuk button 'insert'
        buttonInsert.layer.cornerRadius = 10
        // shadow untuk button 'insert'
        buttonInsert.layer.shadowColor = UIColor.black.cgColor
        buttonInsert.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonInsert.layer.shadowOpacity = 0.3
        buttonInsert.layer.shadowRadius = 4.0
        buttonInsert.backgroundColor = UIColor.orange
        
        // corner radius untuk button 'cancel'
        buttonCancel.layer.cornerRadius = 10
        // shadow untuk button 'cencel'
        buttonCancel.layer.shadowColor = UIColor.black.cgColor
        buttonCancel.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonCancel.layer.shadowOpacity = 0.3
        buttonCancel.layer.shadowRadius = 4.0
        buttonCancel.backgroundColor = UIColor.orange
        
        accessibility()
    }
    
    @IBAction func buttonTappedInsert(_ sender: Any){
        if buttonInsert.backgroundColor == UIColor.orange {
            buttonInsert.backgroundColor = UIColor.systemPink
        }
        else if buttonInsert.backgroundColor == UIColor.systemPink {
            buttonInsert.backgroundColor = UIColor.orange
        }
    }
    
    @IBAction func buttonTappedCancel(_ sender: Any){
        if buttonCancel.backgroundColor == UIColor.orange {
            buttonCancel.backgroundColor = UIColor.systemPink
        }
        else if buttonCancel.backgroundColor == UIColor.systemPink {
            buttonCancel.backgroundColor = UIColor.orange
        }
    }

    @IBAction func insertIdButton(_ sender: Any) {
        
//        dismiss(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        dismiss(animated: true)
    }
}

extension InsertTaskViewController {
    func accessibility() {
        titlePopup.font = .preferredFont(forTextStyle: .subheadline)
        titlePopup.adjustsFontForContentSizeCategory = true
        buttonInsert.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        buttonInsert.titleLabel?.adjustsFontForContentSizeCategory = true
        buttonCancel.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)
        buttonCancel.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
}

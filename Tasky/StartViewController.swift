//
//  StartViewController.swift
//  Tasky
//
//  Created by Indra Kurniawan on 29/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var username: UILabel!
    
    var usernameLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load nama user berdasarkan input name
        self.username?.text = usernameLabel
    }
    
}


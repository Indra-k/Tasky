//
//  SelectRoleController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 30/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import Foundation
import UIKit

class SelectRoleController: UIViewController {
    
    @IBOutlet weak var UserName: UILabel!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UserName?.text = "Welcome \(username)"
    }
    
}

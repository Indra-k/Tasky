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
    @IBOutlet weak var gifHusky: UIImageView!
    @IBOutlet weak var taskButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var calenderButton: UIButton!
    
    var usernameLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load nama user berdasarkan input name
        self.username?.text = ("Hai \(usernameLabel)")
        
        gifHusky.loadGif(name: "Husky Diam")
        
        taskButton.backgroundColor = UIColor.init(red: 205, green: 236, blue: 255, alpha: 0)
        startButton.backgroundColor = UIColor.init(red: 205, green: 236, blue: 255, alpha: 0)
        calenderButton.backgroundColor = UIColor.init(red: 205, green: 236, blue: 255, alpha: 0)
        
        username.text = NSLocalizedString("startview_username", comment: "")
        
        accessibility()
    }
    
    /*@IBAction func buttonTappedTask(_ sender: Any) {
        if taskButton.backgroundColor == UIColor.init(red: 205, green: 236, blue: 255, alpha: 0) {
            taskButton.backgroundColor = UIColor.systemPink
        }
        else if taskButton.backgroundColor == UIColor.systemPink {
            taskButton.backgroundColor = UIColor.init(red: 205, green: 236, blue: 255, alpha: 0)
        }
    }
    
    @IBAction func buttonTappedStart(_ sender: Any) {
        if startButton.backgroundColor == UIColor.orange {
            startButton.backgroundColor = UIColor.systemPink
        }
        else if startButton.backgroundColor == UIColor.systemPink {
            startButton.backgroundColor = UIColor.orange
        }
    }
    
    @IBAction func buttonTappedCalender(_ sender: Any) {
        if calenderButton.backgroundColor == UIColor.orange {
            calenderButton.backgroundColor = UIColor.systemPink
        }
        else if calenderButton.backgroundColor == UIColor.systemPink {
            calenderButton.backgroundColor = UIColor.orange
        }
    }
    
}*/

}

extension StartViewController {
    func accessibility() {
        username.font = .preferredFont(forTextStyle: .title1)
        username.adjustsFontForContentSizeCategory = true
    }
}

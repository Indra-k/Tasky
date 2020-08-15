//
//  PopUpPauseResumeViewController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 09/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class PopUpBreakViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var gifHuskyImg: UIImageView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func shortBreak() {
        titleLabel.text = ""
        informationLabel.text = ""
        gifHuskyImg.loadGif(name: "Husky Lelah")
    }
    func longBreak() {
        titleLabel.text = ""
        informationLabel.text = ""
        gifHuskyImg.loadGif(name: "Husky Lelah")
    }
    func longBreakAfter() {
        titleLabel.text = ""
        informationLabel.text = ""
        gifHuskyImg.loadGif(name: "Husky Senang After Break")
    }

    @IBAction func closeReward(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
}

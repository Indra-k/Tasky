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
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var poTouchButton: UIButton!
    @IBOutlet weak var designerTouchButton: UIButton!
    @IBOutlet weak var artistTouchButton: UIButton!
    @IBOutlet weak var programmerTouchButton: UIButton!
    @IBOutlet weak var soundEngTouchButton: UIButton!
    
    var userWelcome = ""
    let questionRole = "What is your role?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load nama user berdasarkan input name
        self.UserName?.text = "Welcome \(userWelcome)"
        
        // change question di box
        roleLabel.text? = questionRole
        
        // corner radius untuk button 'PO'
        poTouchButton.layer.cornerRadius = 10
        // shadow untuk button 'PO'
        poTouchButton.layer.shadowColor = UIColor.black.cgColor
        poTouchButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        poTouchButton.layer.shadowOpacity = 0.3
        poTouchButton.layer.shadowRadius = 4.0
        poTouchButton.backgroundColor = UIColor.orange
        
        // corner radius untuk button 'designer'
        designerTouchButton.layer.cornerRadius = 10
        // shadow untuk button 'designer'
        designerTouchButton.layer.shadowColor = UIColor.black.cgColor
        designerTouchButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        designerTouchButton.layer.shadowOpacity = 0.3
        designerTouchButton.layer.shadowRadius = 4.0
        designerTouchButton.backgroundColor = UIColor.orange
        
        // corner radius untuk button 'artist'
        artistTouchButton.layer.cornerRadius = 10
        // shadow untuk button 'artist'
        artistTouchButton.layer.shadowColor = UIColor.black.cgColor
        artistTouchButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        artistTouchButton.layer.shadowOpacity = 0.3
        artistTouchButton.layer.shadowRadius = 4.0
        artistTouchButton.backgroundColor = UIColor.orange
        
        // corner radius untuk button 'programmer'
        programmerTouchButton.layer.cornerRadius = 10
        // shadow untuk button 'programmer'
        programmerTouchButton.layer.shadowColor = UIColor.black.cgColor
        programmerTouchButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        programmerTouchButton.layer.shadowOpacity = 0.3
        programmerTouchButton.layer.shadowRadius = 4.0
        programmerTouchButton.backgroundColor = UIColor.orange
        
        // corner radius untuk button 'programmer'
        soundEngTouchButton.layer.cornerRadius = 10
        // shadow untuk button 'programmer'
        soundEngTouchButton.layer.shadowColor = UIColor.black.cgColor
        soundEngTouchButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        soundEngTouchButton.layer.shadowOpacity = 0.3
        soundEngTouchButton.layer.shadowRadius = 4.0
        soundEngTouchButton.backgroundColor = UIColor.orange
    }
    
    @IBAction func buttonTappedPo(_ sender: Any) {
        if poTouchButton.backgroundColor == UIColor.orange {
            poTouchButton.backgroundColor = UIColor.systemPink
        }
        else if poTouchButton.backgroundColor == UIColor.systemPink {
            poTouchButton.backgroundColor = UIColor.orange
        }
    }
    @IBAction func buttonTappedDesigner(_ sender: Any){
        if designerTouchButton.backgroundColor == UIColor.orange {
            designerTouchButton.backgroundColor = UIColor.systemPink
        }
        else if designerTouchButton.backgroundColor == UIColor.systemPink {
            designerTouchButton.backgroundColor = UIColor.orange
        }
    }
    @IBAction func buttonTappedArtist(_ sender: Any){
        if artistTouchButton.backgroundColor == UIColor.orange {
            artistTouchButton.backgroundColor = UIColor.systemPink
        }
        else if artistTouchButton.backgroundColor == UIColor.systemPink {
            artistTouchButton.backgroundColor = UIColor.orange
        }
    }
    @IBAction func buttonTappedProgrammer(_ sender: Any){
        if programmerTouchButton.backgroundColor == UIColor.orange {
            programmerTouchButton.backgroundColor = UIColor.systemPink
        }
        else if programmerTouchButton.backgroundColor == UIColor.systemPink {
            programmerTouchButton.backgroundColor = UIColor.orange
        }
    }
    @IBAction func buttonTappedSoundEng(_ sender: Any){
        if soundEngTouchButton.backgroundColor == UIColor.orange {
                soundEngTouchButton.backgroundColor = UIColor.systemPink
        }
            else if soundEngTouchButton.backgroundColor == UIColor.systemPink {
                soundEngTouchButton.backgroundColor = UIColor.orange
        }
    }
    
    //kirim username ke main screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let vc = segue.destination as! StartViewController
        vc.usernameLabel = self.userWelcome
    }
    
}

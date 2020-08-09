//
//  ViewController.swift
//  Tasky
//
//  Created by Indra Kurniawan on 28/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class InsertNameController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var saveNameTouchButton: UIButton!
    
    let titleName = "What is your name?"
    let defaults = UserDefaults.standard
    var usernameData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.username.delegate = self
        usernameSaved()
        
        // judul/title Nama user
        usernameLabel?.text = titleName
        
        // corner radius untuk button 'done'
        saveNameTouchButton.layer.cornerRadius = 10
        // shadow untuk button 'done'
        saveNameTouchButton.layer.shadowColor = UIColor.black.cgColor
        saveNameTouchButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        saveNameTouchButton.layer.shadowOpacity = 0.3
        saveNameTouchButton.layer.shadowRadius = 4.0
    }
    // for hide keyboard by touch view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // for hide keyboard by return
    private func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return (true)
    }
    
//---------------for saving username--------------------//
    func saveUsername() {
        defaults.set(username.text, forKey: self.usernameData)
    }
    func usernameSaved() {
        let userName = defaults.value(forKey: self.usernameData) as? String ?? ""
        username.text = userName
    }
    @IBAction func buttonDone(_ sender: Any) {
        self.usernameData = username.text!
        performSegue(withIdentifier: "usernameSaved", sender: self)
        saveUsername()
    }
    // kirim nama user ke screen select role
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SelectRoleController
        vc.userWelcome = self.username.text!
    }
}


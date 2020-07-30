//
//  ViewController.swift
//  Tasky
//
//  Created by Indra Kurniawan on 28/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class InsertNameController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    
    let defaults = UserDefaults.standard
    var usernameData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.username.delegate = self
        usernameSaved()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let viewController = segue.destination as! SelectRoleController
        viewController.username = self.username.text!
    }
}


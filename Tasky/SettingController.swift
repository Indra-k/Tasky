//
//  MainScreenViewController.swift
//  Tasky
//
//  Created by Indra Kurniawan on 29/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class SettingController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var workIntervalBtn: UIButton!
    @IBOutlet weak var workTimeBtn: UIButton!
    @IBOutlet weak var shortBreakBtn: UIButton!
    @IBOutlet weak var longBreakBtn: UIButton!
    @IBOutlet weak var longBreakAfterBtn: UIButton!
    @IBOutlet weak var buttonStartTask: UIButton!
    
    @IBOutlet weak var workIntervalLabel: UILabel!
    @IBOutlet weak var workTimeLabel: UILabel!
    @IBOutlet weak var shortBreakLabel: UILabel!
    @IBOutlet weak var longBreakLabel: UILabel!
    @IBOutlet weak var longBreakAfterLabel: UILabel!
    
    var selectedButton = UIButton()
    var selectedList : [String] = []
    let workInterval = ["1x", "2x", "3x", "4x", "5x", "6x", "7x", "8x", "9x", "10x"]
    let workTime = ["5 min", "10 min", "15 min", "20 min", "25 min", "30 min", "35 min", "40 min", "55 min", "60 min"]
    let shortBreak = ["1 min", "2 min", "3 min", "4 min", "5 min", "6 min", "7 min", "8 min", "9 min", "10 min"]
    let longBreak = ["5 min", "10 min", "15 min", "20 min", "25 min", "30 min"]
    let longBreakAfter = ["2 Interval", "3 Interval", "4 Interval", "5 Interval", "6 Interval", "7 Interval", "8 Interval"]
    
    var settingDefault = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.isHidden = true
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // corner radius untuk button 'done'
        buttonStartTask.layer.cornerRadius = 10
        // shadow untuk button 'done'
        buttonStartTask.layer.shadowColor = UIColor.black.cgColor
        buttonStartTask.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonStartTask.layer.shadowOpacity = 0.3
        buttonStartTask.layer.shadowRadius = 4.0
        
        workIntervalBtn.titleLabel?.text = settingDefault
        workTimeBtn.titleLabel?.text = settingDefault
        shortBreakBtn.titleLabel?.text = settingDefault
        longBreakBtn.titleLabel?.text = settingDefault
        longBreakAfterBtn.titleLabel?.text = settingDefault
        buttonStartTask.backgroundColor = UIColor.white
        
        accessibility()
    }
    
//    @IBAction func buttonTapped(_ sender: Any) {
//        if buttonStartTask.backgroundColor == UIColor.white {
//            buttonStartTask.backgroundColor = UIColor.init(red: 205, green: 236, blue: 255, alpha: 0)
//        }
//        else if buttonStartTask.backgroundColor == UIColor.white {
//            buttonStartTask.backgroundColor = UIColor.init(red: 205, green: 236, blue: 255, alpha: 0)
//        }
//    }
    
    //MARK: - Work Interval
    @IBAction func workIntervalPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = workIntervalBtn
        selectedList = workInterval
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Work Time
    @IBAction func workTimePressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = workTimeBtn
        selectedList = workTime
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Short Break
    @IBAction func shortBreakPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = shortBreakBtn
        selectedList = shortBreak
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Long Break
    @IBAction func longBreakPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = longBreakBtn
        selectedList = longBreak
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Long Break After
    @IBAction func longBreakAfterPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = longBreakAfterBtn
        selectedList = longBreakAfter
        
        pickerView.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectedList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectedList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedButton.setTitle(selectedList[row], for: .normal)
        pickerView.isHidden = true
    }
    
    @IBAction func startTimerButton(_ sender: Any) {
        saveData(btn: workIntervalBtn, title: "WorkInterval")
        saveData(btn: workTimeBtn, title: "WorkTime")
        saveData(btn: shortBreakBtn, title: "ShortBreakNum")
        saveData(btn: longBreakBtn, title: "LongbreakNum")
        saveData(btn: longBreakAfterBtn, title: "LongBreakAfter")
        
        performSegue(withIdentifier: "startTask", sender: nil)
    }
    
    func saveData(btn:UIButton, title : String){
        let num = getInt(s: btn.titleLabel?.text! ?? "0")
        let userdef = UserDefaults.standard
        userdef.set(num, forKey: title)
    }
    
    func getInt(s:String)->Int{
        let stringArray = s.components(separatedBy: CharacterSet.decimalDigits.inverted)
        for item in stringArray {
            if let number = Int(item) {
                return number
            }
        }
        return 0
    }
}

extension SettingController {
func accessibility() {
    workIntervalLabel.font = .preferredFont(forTextStyle: .body)
    workIntervalLabel.adjustsFontForContentSizeCategory = true
    workTimeLabel.font = .preferredFont(forTextStyle: .body)
    workTimeLabel.adjustsFontForContentSizeCategory = true
    shortBreakLabel.font = .preferredFont(forTextStyle: .body)
    shortBreakLabel.adjustsFontForContentSizeCategory = true
    longBreakLabel.font = .preferredFont(forTextStyle: .body)
    longBreakLabel.adjustsFontForContentSizeCategory = true
    longBreakAfterLabel.font = .preferredFont(forTextStyle: .body)
    longBreakAfterLabel.adjustsFontForContentSizeCategory = true
    workIntervalBtn.titleLabel?.font = .preferredFont(forTextStyle: .body)
    workIntervalBtn.titleLabel?.adjustsFontForContentSizeCategory = true
    workTimeBtn.titleLabel?.font = .preferredFont(forTextStyle: .body)
    workTimeBtn.titleLabel?.adjustsFontForContentSizeCategory = true
    shortBreakBtn.titleLabel?.font = .preferredFont(forTextStyle: .body)
    shortBreakBtn.titleLabel?.adjustsFontForContentSizeCategory = true
    longBreakBtn.titleLabel?.font = .preferredFont(forTextStyle: .body)
    longBreakBtn.titleLabel?.adjustsFontForContentSizeCategory = true
    longBreakAfterBtn.titleLabel?.font = .preferredFont(forTextStyle: .body)
    longBreakAfterBtn.titleLabel?.adjustsFontForContentSizeCategory = true
    buttonStartTask.titleLabel?.font = .preferredFont(forTextStyle: .body)
    buttonStartTask.titleLabel?.adjustsFontForContentSizeCategory = true
}

}

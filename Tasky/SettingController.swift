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
    
    var selectedButton = UIButton()
    var selectedList : [String] = []
    let workInterval = ["1x", "2x", "3x", "4x", "5x", "6x", "7x", "8x", "9x", "10x"]
    let workTime = ["1 min", "5 min", "10 min", "15 min", "20 min", "25 min", "30 min", "35 min", "40 min", "55 min", "60 min"]
    let shortBreak = ["1 min", "2 min", "3 min", "4 min", "5 min", "6 min", "7 min", "8 min", "9 min", "10 min"]
    let longBreak = ["5 min", "10 min", "15 min", "20 min", "25 min", "30 min"]
    let longBreakAfter = ["2 Interval", "3 Interval", "4 Interval", "5 Interval", "6 Interval", "7 Interval", "8 Interval"]
    
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
        
        
        workIntervalBtn.titleLabel?.text = workInterval[0]
        workTimeBtn.titleLabel?.text = workTime[0]
        shortBreakBtn.titleLabel?.text = shortBreak[0]
        longBreakBtn.titleLabel?.text = longBreak[0]
        longBreakAfterBtn.titleLabel?.text = longBreakAfter[0]
    }
    
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



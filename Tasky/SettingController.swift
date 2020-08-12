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
    let workInterval = ["1", "2", "3", "4", "5" ,"6" ,"7" ,"8" ,"9" ,"10" ,"11" ,"12" ,"13" ,"14" ,"15" ,"16"]
    let workTime = ["5" ,"10" ,"15" ,"20" ,"25" ,"30" ,"35" ,"40" ,"55" ,"60"]
    let shortBreak = ["1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"10" ,"15" ,"20" ,"25" ,"30"]
    let longBreak = ["5" ,"10" ,"15" ,"20" ,"25" ,"30" ,"35" ,"40" ,"55" ,"60"]
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
    }
    
    //MARK: - Work Interval
    @IBAction func workIntervalPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = workIntervalBtn
        selectedList = workInterval
        print(selectedList[0])
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Work Time
    @IBAction func workTimePressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = workTimeBtn
        selectedList = workTime
        print(selectedList[0])
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Short Break
    @IBAction func shortBreakPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = shortBreakBtn
        selectedList = shortBreak
        print(selectedList[0])
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Long Break
    @IBAction func longBreakPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = longBreakBtn
        selectedList = longBreak
        print(selectedList[0])
        
        pickerView.reloadAllComponents()
    }
    
    //MARK: - Long Break After
    @IBAction func longBreakAfterPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
        selectedButton = longBreakAfterBtn
        selectedList = longBreakAfter
        print(selectedList[0])
        
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
        
    }
}



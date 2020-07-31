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
    
    let workInterval = ["1", "2", "3", "4", "5" ,"6" ,"7" ,"8" ,"9" ,"10" ,"11" ,"12" ,"13" ,"14" ,"15" ,"16"]
    let workTime = ["5" ,"10" ,"15" ,"20" ,"25" ,"30" ,"35" ,"40" ,"55" ,"60"]
    let shortBreak = ["1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"10" ,"15" ,"20" ,"25" ,"30"]
    let longBreak = ["5" ,"10" ,"15" ,"20" ,"25" ,"30" ,"35" ,"40" ,"55" ,"60"]
    let lBreakAfter = ["2 Interval", "3 Interval", "4 Interval", "5 Interval", "6 Interval", "7 Interval", "8 Interval"]
    
    override func viewDidLoad() {
        
        pickerView.isHidden = true
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Work Interval
    @IBAction func workIntervalPressed(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return workInterval.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return workInterval[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        workIntervalBtn.setTitle(workInterval[row], for: .normal)
        pickerView.isHidden = true
    }
    
}

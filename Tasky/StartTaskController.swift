//
//  StartTaskController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 06/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import Foundation
import UIKit

class StartTaskController: UIViewController {
    
    var timer = Timer()
    var counter = 0
    var timerStop = true
    
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var PauseBtn: UIButton!
    @IBOutlet weak var gifHusky: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDef = UserDefaults.standard
        counter =  userDef.integer(forKey: "WorkTime")
        counter = counter * 60
        let mtitle = secondsToMinutesAndSeconds(seconds: counter)
        timerText?.text = String(mtitle)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        timer.fire()
        
        //gif
        gifHusky.loadGif(name: "Husky Nunggu")
        
        accessibility()
    }
    
    @objc func countDown(){
        counter-=1
        let mtitle = secondsToMinutesAndSeconds(seconds: counter)
        timerText?.text = String(mtitle)
        if counter == 0 {
            timer.invalidate()
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        if timerStop == true {
            timer.invalidate()
            PauseBtn.setBackgroundImage(UIImage(named: "Time Button"), for: .normal)
            timerStop = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            timer.fire()
            PauseBtn.setBackgroundImage(UIImage(named: "Pause Button"), for: .normal)
            timerStop = true
        }
    }

    func secondsToMinutesAndSeconds(seconds: Int) -> String {
            let minutes = "\((seconds % 3600) / 60)"
            let seconds = "\((seconds % 3600) % 60)"
            let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
            let secondStamp = seconds.count > 1 ? seconds : "0" + seconds
            
            return "\(minuteStamp) : \(secondStamp)"
        }
}

extension StartTaskController {
    func accessibility() {
        timerText.font = .preferredFont(forTextStyle: .headline)
        timerText.adjustsFontForContentSizeCategory = true
    }
}
//func restart(_ sender: Any) {
//    timer.fire()
//    PauseBtn.setBackgroundImage(UIImage(named: "Pause Button"), for: .normal)
//}

//
//  ViewController.swift
//  Tasky
//
//  Created by Pradipta Eva on 17/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = NSLocalizedString("calendar_message", comment: "")
        reportButton.setTitle(NSLocalizedString("calendar_report", comment: ""), for: .normal)
        monthLabel.text = NSLocalizedString("calendar_month", comment: "")
        weekLabel.text = NSLocalizedString("calendar_week", comment: "")
        reportButton.setTitle(NSLocalizedString("calendar_main", comment: ""), for: .normal)
        
        applyAccessibility()
    }
}

extension CalendarViewController {
func applyAccessibility() {
    messageLabel.font = .preferredFont(forTextStyle: .body)
    messageLabel.adjustsFontForContentSizeCategory = true
    monthLabel.font = .preferredFont(forTextStyle: .largeTitle)
    monthLabel.adjustsFontForContentSizeCategory = true
    weekLabel.font = .preferredFont(forTextStyle: .title2)
    weekLabel.adjustsFontForContentSizeCategory = true
    mainButton.titleLabel?.font = .preferredFont(forTextStyle: .title1)
    mainButton.titleLabel?.adjustsFontForContentSizeCategory = true
    reportButton.titleLabel?.font = .preferredFont(forTextStyle: .title2)
    reportButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}

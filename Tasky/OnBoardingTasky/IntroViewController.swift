//
//  IntroViewController.swift
//  OnBoarding Tasky Test
//
//  Created by Pradipta Eva on 10/08/20.
//  Copyright © 2020 Pradipta Eva. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    @IBOutlet weak var getstartButton: UIButton!
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: Asset.illustrate1.image,
                           title: "Define Your Stage",
                           description: "To get started, define your development stage first. In the GDLC cycle, select at which stage do your developer team working at the moment.",
                           pageIcon: Asset.indicator1.image,
                           color: UIColor.systemBackground,
                           titleColor: UIColor.label, descriptionColor: UIColor.label, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.illustrate2.image,
                           title: "Manage Your Task",
                           description: "In the Task List menu, you can add task as you need and assign it to your developer team member, add description and due date as well.",
                           pageIcon: Asset.indicator2.image,
                           color: UIColor.systemBackground,
                           titleColor: UIColor.label, descriptionColor: UIColor.label, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.illustrate3.image,
                           title: "Organise Your Time",
                           description: "Increase your productivity by organising your working time and break time using pomodoro timer, adjust it as you need in time set menu.",
                           pageIcon: Asset.indicator3.image,
                           color: UIColor.systemBackground,
                           titleColor: UIColor.label, descriptionColor: UIColor.label, titleFont: titleFont, descriptionFont: descriptionFont),
        
        OnboardingItemInfo(informationImage: Asset.illustrate4.image,
                           title: "Track Your Progress",
                           description: "Keep on track and know your hardwork by using calendar tracker, a husky’s footprint will appear after you finish a task assigned to you.",
                           pageIcon: Asset.indicator4.image,
                           color: UIColor.systemBackground,
                           titleColor: UIColor.label, descriptionColor: UIColor.label, titleFont: titleFont, descriptionFont: descriptionFont),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getstartButton.layer.cornerRadius = 10
        
        getstartButton.isHidden = true
        
        setupPaperOnboardingView()
        
        view.bringSubviewToFront(getstartButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
}

// MARK: Actions

extension IntroViewController {
    @IBAction func getstartButtonTapped(_: UIButton) {
        print(#function)
        print("button getstart")
        
        //Pergi ke menu utama
        performSegue(withIdentifier: "viewcontroller", sender: nil)
    }
}

// MARK: PaperOnboardingDelegate

extension IntroViewController: PaperOnboardingDelegate {
    func onboardingWillTransitonToIndex(_ index: Int) {
        getstartButton.isHidden = index == 3 ? false : true
    }
    
    func onboardingDidTransitonToIndex(_: Int) {
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
}

// MARK: PaperOnboardingDataSource

extension IntroViewController: PaperOnboardingDataSource {
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return 4
    }
    
}


//MARK: Constants
extension IntroViewController {
    private static let titleFont = UIFont(name: "Nunito-Bold", size: 24.0) ?? UIFont.boldSystemFont(ofSize: 24.0)
    private static let descriptionFont = UIFont(name: "sans-serif", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
}

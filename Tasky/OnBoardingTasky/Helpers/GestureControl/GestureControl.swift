//
//  GestureControl.swift
//  OnBoarding Tasky Test
//
//  Created by Pradipta Eva on 10/08/20.
//  Copyright © 2020 Pradipta Eva. All rights reserved.
//

import UIKit

protocol GestureControlDelegate: class {
    func gestureControlDidSwipe(_ direction: UISwipeGestureRecognizer.Direction)
}

class GestureControl: UIView {

    weak var delegate: GestureControlDelegate!

    init(view: UIView, delegate: GestureControlDelegate) {
        self.delegate = delegate

        super.init(frame: CGRect.zero)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(GestureControl.swipeHandler(_:)))
        swipeLeft.direction = .left
        addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(GestureControl.swipeHandler(_:)))
        swipeRight.direction = .right
        addGestureRecognizer(swipeRight)

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear

        view.addSubview(self)
        // add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            (view, self) >>>- {
                $0.attribute = attribute
                return
            }
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: actions

extension GestureControl {

    @objc dynamic func swipeHandler(_ gesture: UISwipeGestureRecognizer) {
        delegate.gestureControlDidSwipe(gesture.direction)
    }
}


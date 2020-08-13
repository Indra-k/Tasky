//
//  Configuring.swift
//  OnBoarding Tasky Test
//
//  Created by Pradipta Eva on 10/08/20.
//  Copyright © 2020 Pradipta Eva. All rights reserved.
//

import Foundation

internal func Init<Type>(_ value: Type, block: (_ object: Type) -> Void) -> Type {
    block(value)
    return value
}

//
//  Extension.swift
//  TouchIDHelp
//
//  Created by Dershowitz on 21/04/16.
//  Copyright © 2016 Dershowitz. All rights reserved.
//

import Foundation


extension Int {
    internal func toEnum<Enum: RawRepresentable where Enum.RawValue == Int>() -> Enum? {
        return Enum(rawValue: self)
    }
}

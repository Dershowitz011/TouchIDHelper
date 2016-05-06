//
//  Helper.swift
//  TouchIDHelp
//
//  Created by Dershowitz on 01/04/16.
//  Copyright © 2016 Dershowitz. All rights reserved.
//

public enum TouchIDResp {
    case Pass
    case Fail(TouchIDError)
}

extension TouchIDResp: Equatable{}

public func == (lhs: TouchIDResp, rhs:TouchIDResp) -> Bool {
    switch (lhs,rhs)
    {
    case (.Pass, .Pass):
        return true
    
    case (let .Fail(f1), let .Fail(f2)):
    return f1 == f2
    default:
    return false
}
}






    
    
    
    

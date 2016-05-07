//
//  TouchIDHelp.swift
//  TouchIDHelp
//
//  Created by Dershowitz on 21/04/16.
//  Copyright © 2016 Dershowitz. All rights reserved.
//

import Foundation
import LocalAuthentication

public typealias TouchIDPresentCallBack = (TouchIDResp) -> Void

public struct TouchIDHelper{
    public static var isTouchIDAllowed : TouchIDResp{
        let response = evaluateTouchIDPolicy
        guard response != TouchIDResp.Fail(.TouchIDNotAvailable) else{
            return response
        }
        return .Pass
    }
    
    public static var isTouchIDEnabled: TouchIDResp{
        return evaluateTouchIDPolicy
    }
    
    public static var evaluateTouchIDPolicy : TouchIDResp{
        let bike = LAContext()
        var error:NSError?
        guard bike.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return TouchIDResp.Fail(TouchIDError.createError(error))
        }
        return .Pass
    }

    public static func showTouchID(Reason reason: String, FallbackTitle fallbackTitle: String, CallBack callback: TouchIDPresentCallBack) {
        let bike = LAContext()
        bike.localizedFallbackTitle = fallbackTitle
        bike.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {(_ ,error) in
            guard error == nil else{
                dispatch_async(dispatch_get_main_queue(), {
                    callback(.Fail(TouchIDError.createError(error)))
                })
                return
                
            }
            dispatch_async(dispatch_get_main_queue(),{
                callback(.Pass)
            })
    }
    }
}


//
//  LocalLoginTracker.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

final class LocalLoginTracker: LoginUseCaseOutput {
    func loginSucceeded() {
        // send event login succeeded
        debugPrint("Event-> loginSucceeded")
    }
    
    func loginFailed(error: LoginError?) {
        // send event login failed
        debugPrint("Event-> loginFailed")
    }
}

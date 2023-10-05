//
//  LoginUseCaseOutputComposer.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
   
    let outputs: [LoginUseCaseOutput]
    
    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }
    
    func loginSucceeded() {
        outputs.forEach({ $0.loginSucceeded() })
    }
    
    func loginFailed(error: LoginError?) {
        outputs.forEach({ $0.loginFailed(error: error) })
    }
}

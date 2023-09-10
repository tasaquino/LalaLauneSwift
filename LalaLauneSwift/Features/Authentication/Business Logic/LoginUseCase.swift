//
//  LoginUseCase.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

// Guides:
// business layer should not know anything about concrete implementations
// depend on abstractions
// Open/Closed principle: Open for extension and Closed for changes
// try to use composition instead of inheritance here in use case
// scalable, easy to test, easy to change
// Single responsibility

protocol LoginUseCaseOutput {
    func loginSucceeded()
    func loginFailed()
}

class LoginUseCase {
    let output: LoginUseCaseOutput
    
    init(output: LoginUseCaseOutput) {
        self.output = output
    }
    
    func login(name: String, password: String) {
        // if success
        // output.loginSucceeded()
        // else
        // output.loginFailed()
    }
}

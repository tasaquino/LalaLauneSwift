//
//  LoginUseCase.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucceeded()
    func loginFailed(error: LoginError?)
}

class LoginUseCase {
    let output: LoginUseCaseOutput
    let loginService: LoginService
    
    init(output: LoginUseCaseOutput, service: LoginService) {
        self.output = output
        self.loginService = service
    }
    
    func login(email: String, password: String) async {
        let result = await loginService.login(email: email, password: password)
        result.0 == true ?
        output.loginSucceeded()
        : output.loginFailed(error: result.1)
    }
}

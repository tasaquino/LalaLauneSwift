//
//  LoginPresenter.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

final class LoginPresenter: LoginUseCaseOutput {
    weak private var loginViewDelegate: LoginViewDelegate?
    private var useCase: LoginUseCase?
    
    init(loginViewDelegate: LoginViewDelegate){
        self.loginViewDelegate = loginViewDelegate
    }
    
    func setUseCase(useCase: LoginUseCase) {
        self.useCase = useCase
    }
    
    func login() {
        useCase?.login()
    }
    
    func loginSucceeded() {
        loginViewDelegate?.navigateToHomeScreen()
    }
    
    func loginFailed() {
        loginViewDelegate?.showErrorMessage(error: "Login failed, please try again")
    }
}

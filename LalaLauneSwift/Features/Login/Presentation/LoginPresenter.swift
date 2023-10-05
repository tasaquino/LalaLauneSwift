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
    
    var inputEmail: String {
        loginViewDelegate?.getEmail() ?? ""
    }
    
    var inputPassword: String {
        loginViewDelegate?.getPassword() ?? ""
    }
    
    init(loginViewDelegate: LoginViewDelegate){
        self.loginViewDelegate = loginViewDelegate
    }
    
    func setUseCase(useCase: LoginUseCase) {
        self.useCase = useCase
    }
    
    func login() async {
        if (loginViewDelegate?.validateFields() == true) {
            await useCase?.login(email: inputEmail, password: inputPassword)
        }
    }
    
    func loginSucceeded() {
        loginViewDelegate?.navigateToHomeScreen()
    }
    
    func loginFailed(error: LoginError?) {
        loginViewDelegate?.showErrorMessage(error: error?.message ?? "Login failed")
    }
}

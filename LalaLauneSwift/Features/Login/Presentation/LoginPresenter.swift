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
    
    func login(email: String, password: String) async {
        guard !email.isEmpty && !password.isEmpty
        else {
            loginFailed(error: LoginError(message: "Please provide email / password"))
            return
        }
        
        await useCase?.login(email: email, password: password)
    }
    
    func checkExistentSession() async {
        guard let isLoggedIn = await useCase?.loginService.isLoggedIn()
        else { return }
        
        if (isLoggedIn) {
            loginSucceeded()
        }
    }
    
    func loginSucceeded() {
        loginViewDelegate?.navigateToNotesScreen()
    }
    
    func loginFailed(error: LoginError?) {
        loginViewDelegate?.showErrorMessage(error: error?.message ?? "Login failed")
    }
}

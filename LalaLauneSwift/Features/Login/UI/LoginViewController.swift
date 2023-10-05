//
//  LoginViewController.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 12/9/2023.
//

import Foundation
import UIKit

class LoginViewController : UIViewController, LoginViewDelegate {

    weak var presenter: LoginPresenter?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        let presenter = LoginPresenter(loginViewDelegate: self)
        let useCase = LoginUseCaseFactory().makeUseCaseWith(loginPresenter: presenter)
        presenter.setUseCase(useCase: useCase)
        self.presenter = presenter
    }
    
    @IBAction func loginWithGoogle(_ sender: UIButton) {
        Task {
            await presenter?.login()
        }
    }
    
    func navigateToHomeScreen() {
        let alert = UIAlertController(title: "Navigating to home...", message: "TBD", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        fromMainThread {
            self.present(alert, animated: true)
        }
    }
    
    func showErrorMessage(error: String) {
        let alert = UIAlertController(title: "", message: error, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        fromMainThread {
            self.present(alert, animated: true)
        }
    }
    
    func fromMainThread(block: @escaping () -> Void) {
        Task {
            await MainActor.run {
                block()
            }
        }
    }
    
    func validateFields() -> Bool {
        if (getEmail().isEmpty) {
            showErrorMessage(error: "Please input an e-mail")
            return false
        }
        
        if (getPassword().isEmpty) {
            showErrorMessage(error: "Please input a password")
            return false
        }
        
        return true
    }
    
    func getEmail() -> String {
        return emailField.text ?? ""
    }
    
    func getPassword() -> String {
        return passwordField.text ?? ""
    }
}

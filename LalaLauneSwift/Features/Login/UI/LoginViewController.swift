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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let presenter = LoginPresenter(loginViewDelegate: self)
        let useCase = LoginUseCaseFactory().makeUseCaseWith(loginPresenter: presenter)
        presenter.setUseCase(useCase: useCase)
        self.presenter = presenter
        checkExistentSession()
        animateTitle()
    }
    
    func checkExistentSession() {
        Task {
            await presenter?.checkExistentSession()
        }
    }
    
    func animateTitle() {
        titleLabel.text = ""
        let title = Constants.appName
        var charIndex = 0.0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { [weak self] timer in
                self?.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    @IBAction func loginWithGoogle(_ sender: UIButton) {
        let email = getEmail()
        let password = getPassword()
        Task {
            await presenter?.login(email: email, password: password)
        }
    }
    
    func navigateToNotesScreen() {
        fromMainThread {
            self.performSegue(withIdentifier: Constants.loginToNotesSegue, sender: self)
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
    
    func getEmail()  -> String {
        return emailField.text ?? ""
    }
    
    func getPassword() -> String {
        return passwordField.text ?? ""
    }
}

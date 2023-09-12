//
//  LoginViewController.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 12/9/2023.
//

import Foundation
import UIKit

class LoginViewController : UIViewController, LoginViewDelegate {
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        let presenter = LoginPresenter(loginViewDelegate: self)
        let useCase = LoginUseCaseFactory().makeUseCaseWith(loginPresenter: presenter)
        presenter.setUseCase(useCase: useCase)
        self.presenter = presenter
    }
    
    @IBAction func loginWithGoogle(_ sender: UIButton) {
        presenter?.login()
    }
    
    func navigateToHomeScreen() {
        let alert = UIAlertController(title: "Navigating to home...", message: "TBD", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showErrorMessage(error: String) {
        let alert = UIAlertController(title: error, message: "TBD", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Oh no", style: .default))
        self.present(alert, animated: true)
    }
}

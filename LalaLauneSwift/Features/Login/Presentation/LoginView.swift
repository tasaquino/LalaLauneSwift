//
//  LoginView.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 12/9/2023.
//

import Foundation

protocol LoginViewDelegate : AnyObject {
    func navigateToHomeScreen()
    func showErrorMessage(error: String)
    func getEmail() -> String
    func getPassword() -> String
    func validateFields() -> Bool
}

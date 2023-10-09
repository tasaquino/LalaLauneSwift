//
//  LoginView.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 12/9/2023.
//

import Foundation

protocol LoginViewDelegate : AnyObject {
    func navigateToNotesScreen()
    func showErrorMessage(error: String)
}

//
//  LoginError.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 5/10/2023.
//

import Foundation

class LoginError: Error {
    let message: String
    init(message: String) {
        self.message = message
    }
}

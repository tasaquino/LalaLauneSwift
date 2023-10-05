//
//  LoginRepository.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 11/9/2023.
//

import Foundation

protocol LoginService {
    func login(email: String, password: String) async -> (Bool, LoginError?)
    func isLoggedIn() async -> Bool
}

//
//  SupabaseService.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 12/9/2023.
//

import Foundation

final class SupabaseService: LoginService {
    var loggedIn = false
    func login() -> Bool {
        loggedIn = !loggedIn
        return loggedIn
    }
}

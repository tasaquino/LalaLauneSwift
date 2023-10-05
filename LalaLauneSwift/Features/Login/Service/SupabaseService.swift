//
//  SupabaseService.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 05/10/2023.
//

import Foundation
import Supabase

final class SupabaseService: LoginService {
    let client: SupabaseClient
    
    init(client: SupabaseClient) {
        self.client = client
    }
    
    func login(email: String, password: String) async -> (Bool, LoginError?) {
        do {
            try await client.auth.signIn(email: email, password: password)
            let _ = try await client.auth.session
            return (true, nil)
        } catch {
            return (false, LoginError(message: error.localizedDescription))
        }
    }
    
    func isLoggedIn() async -> Bool {
        do {
            let _ = try await client.auth.session
            return true
        } catch {
            return false
        }
    }
}

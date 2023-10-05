//
//  LoginUseCaseFactory.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation
import Supabase

final class LoginUseCaseFactory {
    private func makeService() -> LoginService {
        return SupabaseService(client: SupabaseClient(supabaseURL: URL(string: Secrets.supabaseUrl)!, supabaseKey: Secrets.supabaseApiKey))
    }
    func makeUseCaseWith(loginPresenter: LoginPresenter) -> LoginUseCase {
        let localTracker = LocalLoginTracker()
        let service = makeService()
        
        return LoginUseCase(output: LoginUseCaseOutputComposer(
            [loginPresenter, localTracker]), service: service)
    }
}

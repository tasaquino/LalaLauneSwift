//
//  LoginUseCaseFactory.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

final class LoginUseCaseFactory {
    func makeService() -> LoginService {
        return SupabaseService()
    }
    func makeUseCaseWith(loginPresenter: LoginPresenter) -> LoginUseCase {
        let localTracker = LocalLoginTracker()
        let service = makeService()
        
        return LoginUseCase(output: LoginUseCaseOutputComposer(
            [loginPresenter, localTracker]), service: service)
    }
}

//
//  LoginUseCaseFactory.swift
//  LalaLauneSwift
//
//  Created by Thais Aquino on 10/9/2023.
//

import Foundation

final class LoginUseCaseFactory {
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer(
            [LoginPresenter(),
             LocalLoginTracker()
            ]))
    }
}

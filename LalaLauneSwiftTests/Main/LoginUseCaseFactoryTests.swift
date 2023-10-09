//
//  LoginUseCaseFactoryTests.swift
//  LalaLauneSwiftTests
//
//  Created by Thais Aquino on 10/9/2023.
//

import XCTest
@testable import LalaLauneSwift

final class LoginUseCaseFactoryTests: XCTestCase {
    func test() {
        let sut = LoginUseCaseFactory()
        let loginView = LoginViewSpy()
        let useCase = sut.makeUseCaseWith(loginPresenter: LoginPresenter(loginViewDelegate: loginView))
        let composer = useCase.output as? LoginUseCaseOutputComposer
        
        XCTAssertTrue((composer != nil))
        XCTAssertEqual(composer?.outputs.count, 2)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: LocalLoginTracker.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { output in
            return output is T
        }.count
    }
}

final class LoginViewSpy: LoginViewDelegate {
    func getEmail() -> String {
        return "test@test.com"
    }
    
    func getPassword() -> String {
        return "123456"
    }
    
    func validateFields() -> Bool {
        true
    }
    
    var navigateToNotesScreenCount = 0
    var showErrorMessageCount = 0
    func navigateToNotesScreen() {
        navigateToNotesScreenCount += 1
    }
    
    func showErrorMessage(error: String) {
        showErrorMessageCount += 1
    }
}

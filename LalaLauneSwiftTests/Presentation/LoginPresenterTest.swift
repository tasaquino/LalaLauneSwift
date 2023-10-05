//
//  LoginPresenterTest.swift
//  LalaLauneSwiftTests
//
//  Created by Thais Aquino on 5/10/2023.
//

import XCTest
@testable import LalaLauneSwift

final class LoginPresenterTest: XCTestCase {
    
    func test_loginSucceeded() async throws {
        let view = LoginViewSpy()
        let sut = LoginPresenter(loginViewDelegate: view)
        let useCase = LoginUseCase(output: sut, service: LoginServiceMock(shouldSimulateSuccess: true))
        sut.setUseCase(useCase: useCase)
        let task = Task {
            await sut.login()
        }
        
        await task.value
        
        XCTAssertEqual(view.navigateToHomeScreenCount, 1)
        XCTAssertEqual(view.showErrorMessageCount, 0)
    }
    
    func test_loginFailed() async throws {
        let view = LoginViewSpy()
        let sut = LoginPresenter(loginViewDelegate: view)
        let useCase = LoginUseCase(output: sut, service: LoginServiceMock(shouldSimulateSuccess: false))
        sut.setUseCase(useCase: useCase)
        let task = Task {
            await sut.login()
        }
        
        await task.value
        
        XCTAssertEqual(view.navigateToHomeScreenCount, 0)
        XCTAssertEqual(view.showErrorMessageCount, 1)
    }
}

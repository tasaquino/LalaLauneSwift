//
//  LoginUseCaseTest.swift
//  LalaLauneSwiftTests
//
//  Created by Thais Aquino on 5/10/2023.
//

import XCTest
@testable import LalaLauneSwift

final class LoginUseCaseTest: XCTestCase {
    
    func test_loginSucceeded() throws {
        let output = LoginOutputSpy()
        let loginService = LoginServiceMock(shouldSimulateSuccess: true)
        let sut = LoginUseCase(output: output, service: loginService)
        
        Task {
            await sut.login(email: "email@email.com", password: "123456")
            
            XCTAssertEqual(output.successCount, 1)
            XCTAssertEqual(output.failureCount, 0)
        }
    }
    
    func test_loginFailed() throws {
        let output = LoginOutputSpy()
        let loginService = LoginServiceMock(shouldSimulateSuccess: false)
        let sut = LoginUseCase(output: output, service: loginService)
        
        Task {
            await sut.login(email: "email@email.com", password: "123456")
            
            XCTAssertEqual(output.successCount, 0)
            XCTAssertEqual(output.failureCount, 1)
        }
    }
}

class LoginOutputSpy: LoginUseCaseOutput {
    var successCount = 0
    var failureCount = 0
    
    func loginSucceeded() {
        successCount += 1
    }
    
    func loginFailed(error: LalaLauneSwift.LoginError?) {
        failureCount += 1
    }
}

class LoginServiceMock: LoginService {
    var shouldSimulateSuccess: Bool
    var error: LoginError?
    init(shouldSimulateSuccess: Bool? = true) {
        self.shouldSimulateSuccess = shouldSimulateSuccess ?? true
        
        if (self.shouldSimulateSuccess == false) {
            error = LoginError(message: "Error")
        }
    }
    func login(email: String, password: String) async -> (Bool, LalaLauneSwift.LoginError?) {
        return (shouldSimulateSuccess, error)
    }
    
    func isLoggedIn() async -> Bool {
        return shouldSimulateSuccess
    }
}

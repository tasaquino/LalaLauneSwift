//
//  LoginUseCaseOutputComposerTests.swift
//  LalaLauneSwiftTests
//
//  Created by Thais Aquino on 10/9/2023.
//

import XCTest
@testable import LalaLauneSwift

final class LoginUseCaseOutputComposeTests: XCTestCase {
    func test() {
        let sut = LoginUseCaseOutputComposer([])
        sut.loginSucceeded()
        sut.loginFailed()
    }
    
    func test_composingMultipleOutputs_delegatesSucceededMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginSucceeded()
        
        XCTAssertEqual(output1.loginSucceedCallCount, 1)
        XCTAssertEqual(output1.loginFailedCallCount, 0)
        
        XCTAssertEqual(output2.loginSucceedCallCount, 1)
        XCTAssertEqual(output2.loginFailedCallCount, 0)
    }
    
    func test_composingMultipleOutputs_delegatesFailedMessage() {
        let output1 = LoginUseCaseOutputSpy()
        let output2 = LoginUseCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])
        
        sut.loginFailed()
        
        XCTAssertEqual(output1.loginSucceedCallCount, 0)
        XCTAssertEqual(output1.loginFailedCallCount, 1)
        
        XCTAssertEqual(output2.loginSucceedCallCount, 0)
        XCTAssertEqual(output2.loginFailedCallCount, 1)
    }
    
    // Mark: Helpers
    
    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var loginSucceedCallCount = 0
        var loginFailedCallCount = 0
        
        func loginSucceeded() {
            loginSucceedCallCount += 1
        }
        
        func loginFailed() {
            loginFailedCallCount += 1
        }
    }
}

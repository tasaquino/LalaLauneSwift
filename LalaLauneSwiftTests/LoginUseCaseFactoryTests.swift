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
        let useCase = sut.makeUseCase()
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

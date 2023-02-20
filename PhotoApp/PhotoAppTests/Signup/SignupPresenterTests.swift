//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Gurjinder Singh on 20/02/23.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupPresenter_whenInformationProvided_willValidateEachProperty() {
        // Arrage
         let signupFormModel = SignupFormModel(
            firstName: "Gurjinder",
            lastName: "Singh",
            email: "gurjinder663@gmail.com",
            password: "123456",
            repeatPassword: "123456")
        
        let mockSignupModelValidator = MockSignupFormModelValidator()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        // Assert
        
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  PhotoAppTests.swift
//  PhotoAppTests
//
//  Created by Gurjinder Singh on 01/10/22.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUp() {
        super.setUp()
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testSignupFormModelValidatorTests_WhenFirstNameProvided_ShouldReturnTrue() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Gurjinders")
        XCTAssertTrue(isFirstNameValid,"")
    }
    
    func testSignupFormModelValidatorTest_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "s")
        XCTAssertFalse(isFirstNameValid,"")
    }
    
    func testSingupFormModelValidatorTests_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Gurjinder Singh")
        XCTAssertFalse(isFirstNameValid)
    }
    
    func testSingupFormModelValidatorTests_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        
        //Act
        let isPasswordValid = sut.isPasswordVaid(password: "12")
        
        //Assert
        XCTAssertFalse(isPasswordValid)
    }
    
    func testSingupFormModelValidatorTests_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        //Act
        let isPasswordValid = sut.isPasswordVaid(password: "1234567890123")
        
        //Assert
        XCTAssertFalse(isPasswordValid)
    }
    
    func testSignupFormModelValidatorTests_WhenEqualPasswordsProvided_ShouldReturnTrue() {
      
        //Act
        let doPasswordMatch = sut.doPasswordMatch(password: "1234567", repeatPassword: "1234567")
        
        //Assert
        XCTAssertTrue(doPasswordMatch)
    }
    
    func testSignupFormModelValidatorTests_WhenNotMatchingPasswordsProvided_ShouldReturnTrue() {
      
        //Act
        let doPasswordMatch = sut.doPasswordMatch(password: "12345e7", repeatPassword: "1234567")
        
        //Assert
        XCTAssertFalse(doPasswordMatch)
    }
    
    


}

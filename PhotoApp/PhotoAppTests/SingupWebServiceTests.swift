//
//  SingupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Gurjinder Singh on 02/10/22.
//

import XCTest
@testable import PhotoApp

class SingupWebServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSingupWebServiceTests_WhenGiveSuccessfullResponse_ReturnSucess() {
        //Arrange
        let sut = SignupWebService()
        
        let singupRequestModel = SignupFormRequestModel(firstName: "Gurinder", lasstName: "Singh", email: "gurjinders@gmail.com", password: "12345678")
        sut.singup(withForm: singupRequestModel) { signUpResponseModel, error in
            
        }
    }
    
    

}

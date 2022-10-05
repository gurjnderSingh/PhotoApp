//
//  SingupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Gurjinder Singh on 02/10/22.
//

import XCTest
@testable import PhotoApp

class SingupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!

    override func setUp() {
        super.setUp()
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signFormRequestModel = SignupFormRequestModel(firstName: "Sergey", lasstName: "Kargopolov", email: "test@test.com", password: "12345678")
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSingupWebServiceTests_WhenGiveSuccessfullResponse_ReturnSucess() {

        // Arrange
        let jsonString = "{\"status\":\"Gurjinder Singh\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            //"{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "Gurjinder Singh")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    

}

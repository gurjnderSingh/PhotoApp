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
        signFormRequestModel = SignupFormRequestModel(firstName: "Gurjinder", lasstName: "Singh", email: "gurjindersingh663@gmail.com", password: "12345678")
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testSingupWebServiceTests_WhenGiveSuccessfullResponse_ReturnSucess() {
        // Arrange
        let jsonString = "{\"status\":\"Ok\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            XCTAssertEqual(signupResponseModel?.status, "Ok")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"users\",\"error\":\"Internal server error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structures")
        //Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            
            // Assert
            //"{\"status\":\"Gurjinder Singh\"}"
            XCTAssertNil(signupResponseModel,"The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsingError, "The Singup() method did not return expected errro")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnError() {
        //Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebService.init(urlString: "")
        
        //Act
        sut.signup(withForm: signFormRequestModel) { signFormRequestModel, error in
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "The operation couldn’t be completed. (PhotoApp.SignupError error 0.)"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)

        // Act
        sut.signup(withForm: signFormRequestModel) { (signFormRequestModel, error) in
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription))
            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        // Assert
    }

}

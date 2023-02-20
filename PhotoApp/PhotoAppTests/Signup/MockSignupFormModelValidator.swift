//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Gurjinder Singh on 20/02/23.
//

import Foundation
@testable import PhotoApp

class MockSignupFormModelValidator: SingupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false

    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(firstName: String) -> Bool {
        return true
    }
    
    func isValidEmailFormatter(email: String) -> Bool {
        return true
    }
    
    func isPasswordVaid(password: String) -> Bool {
        return true
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }
}

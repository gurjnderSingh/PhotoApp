//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Gurjinder Singh on 02/10/22.
//

import Foundation


struct SignupFormModelValidator {
    func isFirstNameValid(firstName: String) -> Bool {
        var isValid = true
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            isValid = false
        }
        return isValid
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
    func isPasswordVaid(password: String) -> Bool {
        var returnedValue = true
        if password.count < SignupConstants.passwordMinLength || password.count > SignupConstants.passwordMaxLength {
            returnedValue = false
        }
        return returnedValue
    }
}

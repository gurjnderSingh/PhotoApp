//
//  SingupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Gurjinder Singh on 20/02/23.
//

import Foundation

protocol SingupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(firstName: String) -> Bool
    
    func isValidEmailFormatter(email: String) -> Bool
    func isPasswordVaid(password: String) -> Bool
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
    
}

//
//  SignupError.swift
//  PhotoApp
//
//  Created by Gurjinder Singh on 02/10/22.
//

import Foundation

enum SignupError {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidEmail
    case invalidPassword
    case passwordsDoNotMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,
             .invalidRequestURLString,
             .invalidFirstName,
             .invalidLastName,
             .invalidEmail,
             .invalidPassword,
             .passwordsDoNotMatch:
            return ""
        }
    }
}

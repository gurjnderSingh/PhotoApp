//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Gurjinder Singh on 02/10/22.
//

import Foundation
struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lasstName: String
    let email: String
    let password: String
    
}

//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Gurjinder Singh on 20/02/23.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SingupModelValidatorProtocol
    
    init(formModelValidator: SingupModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
    }
}

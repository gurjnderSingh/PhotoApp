//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Gurjinder Singh on 02/10/22.
//

import Foundation


protocol SignupWebServiceProtocol {
        func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}

struct SignupWebService: SignupWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data=data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                //completionHandler(nil, SignupError.invalidResponseModel)
                completionHandler(nil, SignupError.responseModelParsingError)
                
            }
        }
        
        dataTask.resume()
    }
}

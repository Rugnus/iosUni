//
//  PhoneInteractor.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import Foundation

protocol PhoneProvider {
    init(networkService: NetworkServiceMock, model: Phone)
    
}

final class PhoneInteractor: PhoneProvider {
    
    let networkService: NetworkServiceMock
    var model: Phone
    weak var presenter: PhonePresenter?
    
    init(networkService: NetworkServiceMock, model: Phone) {
        self.networkService = networkService
        self.model = model
    }
    
    @objc func openCodeVC() {
        
        
        let phoneNumberWithOutPattern = model.normalPhoneString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var codeModel = Code()
        codeModel.phoneString = self.model.normalPhoneString
        print(codeModel.phoneString)
        
        networkService.authSent(phoneNumber: phoneNumberWithOutPattern) {  [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.presenter?.didCodeSuccess()
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
    
    
}

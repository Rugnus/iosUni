//
//  PhoneInteractor.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import Foundation

protocol PhoneProvider {
    init(networkService: NetworkServiceMock, model: Phone, router: PhoneRouter)
    
}

final class PhoneInteractor: PhoneProvider {
    
    let networkService: NetworkServiceMock
    var model: Phone
    let router: PhoneRouter
    
    init(networkService: NetworkServiceMock, model: Phone, router: PhoneRouter) {
        self.networkService = networkService
        self.model = model
        self.router = router
    }
    
    @objc func openCodeVC() {
        
        let phoneNumberWithOutPattern = model.normalPhoneString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        networkService.authSent(phoneNumber: phoneNumberWithOutPattern) {  [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.router.openCodeVC()
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
    
    
}

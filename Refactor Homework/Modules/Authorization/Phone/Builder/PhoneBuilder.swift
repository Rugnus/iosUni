//
//  PhoneBuilder.swift
//  Refactor Homework
//
//  Created by Sungur on 30.12.2021.
//

import Foundation
import UIKit

final class PhoneBuilder {
    
    private let networkService: NetworkServiceMock
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func build() -> UIViewController {
        
        let phonePresenter = PhonePresenter(router: PhoneRouter(networkService: NetworkServiceMock(), model: Phone()))
        let phoneVC = PhoneEditViewController(presenter: phonePresenter)
        phonePresenter.phoneVC = phoneVC
        
        return phoneVC
    }
}

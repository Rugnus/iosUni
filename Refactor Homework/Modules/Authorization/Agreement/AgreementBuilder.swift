//
//  CallBuilder.swift
//  Refactor Homework
//
//  Created by Sungur on 30.12.2021.
//

import Foundation
import UIKit

final class AgreementBuilder {
    
    private let networkService: NetworkServiceMock
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func build() -> UIViewController {
        let agreementPresenter = AgreementPresenter(networkService: networkService)
        let agreementViewController = AgreementViewController(networkService: NetworkServiceMock(), presenter: agreementPresenter)
        agreementPresenter.agreementView = agreementViewController
        
        return agreementViewController
    }
}


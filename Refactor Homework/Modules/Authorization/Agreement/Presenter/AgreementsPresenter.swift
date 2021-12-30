//
//  AgreementsPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 11.12.2021.
//

import Foundation

protocol AgreementProtocol {
    func viewDidLoadEvent()
    init(networkService: NetworkServiceMock)
}

final class AgreementPresenter: AgreementProtocol {
    
    let networkService: NetworkServiceMock
    weak var agreementView: AgreementViewController?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func viewDidLoadEvent() {
        agreementView?.setupView()
        agreementView?.layoutView()
        agreementView?.showAgreement()
    }
    
    
}

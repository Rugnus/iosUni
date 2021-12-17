//
//  AgreementsPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 11.12.2021.
//

import Foundation

protocol AgreementProtocol {
    func showAgreement()
    init(agreement: AgreementViewController, networkService: NetworkServiceMock)
}

final class AgreementPresenter {
    
    let networkService: NetworkServiceMock
    let view: AgreementViewController?
    let agreement: Agreement
    
    
    init(networkService: NetworkServiceMock, agreement: Agreement, view: AgreementViewController) {
        self.view = view
        self.agreement = agreement
        self.networkService = networkService
    }
    
    func showAgreement() {
        networkService.getAgreement { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.view?.activityIndicator.stopAnimating()
                switch result {
                case .success(let model):
                    self.view?.agreementTextView.text = model.text
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

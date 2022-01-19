//
//  AgreementsPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 11.12.2021.
//

import Foundation

protocol AgreementProtocol {
    func viewDidLoadEvent()
    func showAgreement()
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
    }
    
    func showAgreement() {
        networkService.getAgreement { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.agreementView?.activityIndicator.stopAnimating()
                switch result {
                case .success(let model):
                    self.agreementView?.agreementTextView.text = model.text
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

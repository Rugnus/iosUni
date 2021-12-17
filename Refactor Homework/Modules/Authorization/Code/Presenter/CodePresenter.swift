//
//  CodePresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 16.12.2021.
//

import Foundation

protocol CodeProtocol {
    init(networkService: NetworkServiceMock, model: Code, view: CodeEditViewController)
    func checkCode()
}

final class CodePresenter: CodeProtocol {
    
    let networkService: NetworkServiceMock
    let model: Code
    let view: CodeEditViewController
    
    init(networkService: NetworkServiceMock, model: Code, view: CodeEditViewController) {
        self.networkService = networkService
        self.model = model
        self.view = view
    }
    
    @objc func checkCode() {
        view.codeField.resignFirstResponder()
        
        view.activityIndicator.startAnimating()
        
        networkService.authSent(smsCode: model.normalCodeString) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.view.activityIndicator.stopAnimating()
                switch result {
                case .success(_):
                    self.view.sendSMSClicked()
                case .failure(_):
                    self.view.alertLabel.isHidden = false
                }
            }
        }
    }
}

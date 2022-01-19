//
//  CodePresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 16.12.2021.
//

import Foundation

protocol CodeProtocol {
    init(networkService: NetworkServiceMock, model: Code)
    func checkCode()
    func viewDidLoadEvent()
    func viewWillAppearEvent()
    func viewWillDisappearEvent()
}

final class CodePresenter: CodeProtocol {
    
    let networkService: NetworkServiceMock
    let model: Code
    weak var codeView: CodeView?
    
    init(networkService: NetworkServiceMock, model: Code) {
        self.networkService = networkService
        self.model = model
    }
    
    func viewDidLoadEvent() {
        codeView?.setupView()
        codeView?.layoutView()
    }
    
    func viewWillAppearEvent() {
        codeView?.willAppear()
    }
    
    func viewWillDisappearEvent() {
        codeView?.willDisappear()
    }
    
    @objc func checkCode() {
        codeView?.updateCodeField()
        
        codeView?.startActivityIndicator()
        
        networkService.authSent(smsCode: model.normalCodeString) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.codeView?.stopActivityIndicator()
                switch result {
                case .success(_):
                    self.codeView?.sendSMSClicked()
                case .failure(_):
                    self.codeView?.showAlertLabel()
                }
            }
        }
    }
}

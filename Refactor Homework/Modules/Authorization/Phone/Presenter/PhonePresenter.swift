//
//  PhonePresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import Foundation

protocol PhonePresenterProtocol {
    init(phoneVC: PhoneEditViewController, router: PhoneRouter, phoneInteractor: PhoneInteractor)
    func didAgreementClicked()
    func didCodeClicked()
    func didTextFieldChange(text: String)
}

final class PhonePresenter: PhonePresenterProtocol {
    
    
    let phoneVC: PhoneEditViewController
    let router: PhoneRouter
    let phoneInteractor: PhoneInteractor
    
    init(phoneVC: PhoneEditViewController, router: PhoneRouter, phoneInteractor: PhoneInteractor) {
        self.phoneVC = phoneVC
        self.router = router
        self.phoneInteractor = phoneInteractor
    }
    
    @objc func didCodeClicked() {
        router.openCodeVC()
    }
    
    @objc func didAgreementClicked() {
        router.openAgreementVC()
    }
    
    func didTextFieldChange(text: String) {
        phoneInteractor.textFieldChange(text: text)
    }
    
}


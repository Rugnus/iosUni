//
//  PhonePresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import Foundation

protocol PhonePresenterProtocol {
    init(router: PhoneRouter)
    func didAgreementClicked()
    func didCodeClicked()
    func viewDidLoadEvent()
    func willAppear()
    func willDisappear()
}

final class PhonePresenter: PhonePresenterProtocol {
    
    
    weak var phoneVC: PhoneEditViewController?
    let router: PhoneRouter
    
    init(router: PhoneRouter) {
        self.router = router
    }
    
    func viewDidLoadEvent() {
        phoneVC?.buildView()
        phoneVC?.buildConstraints()
    }
    
    func willAppear() {
        phoneVC?.willAppear()
    }
    
    func willDisappear() {
        phoneVC?.willDisappear()
    }
    
    @objc func didCodeClicked() {
        router.openCodeVC()
    }
    
    @objc func didAgreementClicked() {
        router.openAgreementVC()
    }
    
    
}


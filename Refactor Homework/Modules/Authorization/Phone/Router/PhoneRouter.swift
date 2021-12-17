//
//  PhoneRouter.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import UIKit

protocol PhoneRouterProtocol: AnyObject {
    var vc: UIViewController? { get }
    func openAgreementVC()
    func openCodeVC()
}

final class PhoneRouter: PhoneRouterProtocol {
    weak var vc: UIViewController?
    let networkService: NetworkServiceMock
    let phoneVC: PhoneEditViewController
    let model: Phone
    
    init(vc: UIViewController, networkService: NetworkServiceMock, phoneVC: PhoneEditViewController, model: Phone) {
        self.vc = vc
        self.networkService = networkService
        self.phoneVC = phoneVC
        self.model = model
    }
    
    
    func openCodeVC() {
        phoneVC.view.endEditing(true)
        
        let phoneNumberWithOutPattern = model.normalPhoneString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        phoneVC.activityIndicator.startAnimating()
        
        networkService.authSent(phoneNumber: phoneNumberWithOutPattern) {  [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.phoneVC.activityIndicator.stopAnimating()
                switch result {
                case .success(_):
                    let codeVC = CodeEditViewController(networkService: self.networkService)
                    codeVC.phoneString = self.model.normalPhoneString
                    self.phoneVC.navigationController?.pushViewController(codeVC, animated: true)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    @objc func openAgreementVC() {
        let agVC = AgreementViewController(networkService: networkService, agreementPresenter: AgreementPresenter)
        phoneVC.navigationController?.pushViewController(agVC, animated: true)
    }
    
}

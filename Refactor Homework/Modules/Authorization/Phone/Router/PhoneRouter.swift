//
//  PhoneRouter.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import UIKit

protocol PhoneRouterProtocol: AnyObject {
    func openAgreementVC()
    func openCodeVC()
}

final class PhoneRouter: PhoneRouterProtocol {
    weak var phoneVC: PhoneEditViewController?
    
    func openCodeVC() {
        phoneVC?.view.endEditing(true)
        let codeBuilder = CodeBuilder(networkService: NetworkServiceMock())
        let codeVC = codeBuilder.build()

        self.phoneVC?.navigationController?.pushViewController(codeVC, animated: true)
                
                
            
        
    }
    @objc func openAgreementVC() {
        let agreementBuilder = AgreementBuilder(networkService: NetworkServiceMock())
        let agVC = agreementBuilder.build()
        phoneVC?.navigationController?.pushViewController(agVC, animated: true)
    }
    
}

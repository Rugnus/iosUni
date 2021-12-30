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
    let model: Phone
    
    init(networkService: NetworkServiceMock, model: Phone) {
        self.model = model
    }
    
    
    func openCodeVC() {
        phoneVC?.view.endEditing(true)
        
        let phoneNumberWithOutPattern = model.normalPhoneString.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        
        let codeBuilder = CodeBuilder(networkService: NetworkServiceMock())
        let codeVC = codeBuilder.build()

        var codeModel = Code()
        codeModel.phoneString = self.model.normalPhoneString
        self.phoneVC?.navigationController?.pushViewController(codeVC, animated: true)
                
                
            
        
    }
    @objc func openAgreementVC() {
        let agreementBuilder = AgreementBuilder(networkService: NetworkServiceMock())
        let agVC = agreementBuilder.build()
        phoneVC?.navigationController?.pushViewController(agVC, animated: true)
    }
    
}

//
//  PhoneBuilder.swift
//  Refactor Homework
//
//  Created by Sungur on 30.12.2021.
//

import Foundation
import UIKit

final class PhoneBuilder {
    func build() -> UIViewController {
        let vc = PhoneEditViewController(networkService: NetworkServiceMock())
        let phone = Phone()
        let networkService = NetworkServiceMock()
        let interactor = PhoneInteractor(phoneVC: vc)
        let router = PhoneRouter(networkService: networkService, phoneVC: vc, model: phone, agreementPresenter: AgreementPresenter(networkService: NetworkServiceMock(), view: AgreementViewController(networkService: NetworkServiceMock())))
        let presenter = PhonePresenter(phoneVC: vc, router: router, phoneInteractor: interactor)
        
        return vc
    }
}

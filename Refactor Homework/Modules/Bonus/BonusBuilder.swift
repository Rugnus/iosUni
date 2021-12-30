//
//  CallBuilder.swift
//  Refactor Homework
//
//  Created by Sungur on 30.12.2021.
//

import Foundation
import UIKit

final class BonusBuilder {
    
    private let networkService: NetworkServiceMock
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func build() -> UIViewController {
        let bonusPresenter = BonusPresenter(networkService: networkService)
        let bonusViewController = BonusViewController(networkService: NetworkServiceMock(), presenter: bonusPresenter)
        bonusPresenter.bonusView = bonusViewController
        
        return bonusViewController
    }
}


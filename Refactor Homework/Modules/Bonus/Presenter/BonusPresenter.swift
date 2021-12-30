//
//  BonusPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 16.12.2021.
//

import Foundation

protocol BonusProtocol {
    func viewDidLoadEvent()
    init(networkService: NetworkServiceMock)
}

final class BonusPresenter: BonusProtocol {
    
    let networkService: NetworkServiceMock
    weak var bonusView: BonusViewController?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func viewDidLoadEvent() {
        bonusView?.setupView()
        bonusView?.layoutView()
        bonusView?.getText()
        bonusView?.getBalance()
    }
    
}

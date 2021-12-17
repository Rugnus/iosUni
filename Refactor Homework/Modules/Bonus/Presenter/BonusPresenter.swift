//
//  BonusPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 16.12.2021.
//

import Foundation

protocol BonusProtocol {
    func getBalance()
    func getText()
    init(networkService: NetworkServiceMock, view: BonusViewController)
}

final class BonusPresenter: BonusProtocol {
    
    let networkService: NetworkServiceMock
    let view: BonusViewController?
    
    init(networkService: NetworkServiceMock, view: BonusViewController) {
        self.networkService = networkService
        self.view = view
    }
    
    func getBalance() {
        networkService.getBonusBalance { (result) in
            DispatchQueue.main.async {
                self.view?.activityIndicator.stopAnimating()
                switch result {
                case .success(let model):
                    self.view?.bonusQuantity.text = "\(model.bonusAmount)"
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getText() {
        networkService.getBonusText { (result) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.view?.bonusTextView.text = model.bonusText
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

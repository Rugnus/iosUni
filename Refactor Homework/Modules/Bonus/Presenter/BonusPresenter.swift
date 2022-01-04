//
//  BonusPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 16.12.2021.
//

import Foundation

protocol BonusProtocol {
    func viewDidLoadEvent()
}

final class BonusPresenter: BonusProtocol {
    
    let networkService: NetworkServiceMock
    weak var bonusView: BonusViewController?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func getBalance() {
        networkService.getBonusBalance { (result) in
            DispatchQueue.main.async {
                self.bonusView?.activityIndicator.stopAnimating()
                switch result {
                case .success(let model):
                    self.bonusView?.bonusQuantity.text = "\(model.bonusAmount)"
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
                    self.bonusView?.bonusTextView.text = model.bonusText
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func viewDidLoadEvent() {
        bonusView?.setupView()
        bonusView?.layoutView()
        self.getText()
        self.getBalance()
    }
    
    
    
}

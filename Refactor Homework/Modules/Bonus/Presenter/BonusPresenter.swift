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
    weak var bonusView: BonusView?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func getBalance() {
        networkService.getBonusBalance { (result) in
            DispatchQueue.main.async {
                self.bonusView?.stopActivityIndicator()
                switch result {
                case .success(let model):
                    self.bonusView?.updateBonusBalance("\(model.bonusAmount)")
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
                    self.bonusView?.getBonusText(model.bonusText)
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

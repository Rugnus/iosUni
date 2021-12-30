//
//  CallBuilder.swift
//  Refactor Homework
//
//  Created by Sungur on 30.12.2021.
//

import Foundation
import UIKit

final class CodeBuilder {
    
    private let networkService: NetworkServiceMock
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func build() -> UIViewController {
        let codePresenter = CodePresenter(networkService: NetworkServiceMock(), model: Code())
        let codeViewController = CodeEditViewController(codeModel: Code(), presenter: codePresenter)
        codePresenter.codeView = codeViewController
        
        return codeViewController
    }
}


//
//  CallPresenter.swift
//  Refactor Homework
//
//  Created by Sungur on 30.12.2021.
//

import Foundation

protocol CallPresenterInterface: AnyObject {
    func getCallNumber(complition: @escaping (Result<Call, Error>) -> Void)
    func viewDidLoadEvent()
    func viewWillAppearEvent()
}

final class CallPresenter: CallPresenterInterface {
    
    // MARK: Private Properties
    
    private let networkService: NetworkServiceMock
    
    weak var callView: CallView?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    // MARK: Public Methods
    
    func getCallNumber(complition: @escaping (Result<Call, Error>) -> Void) {
        networkService.getCallNumber(complition: complition)
    }
    
    func viewDidLoadEvent() {
        callView?.setupView()
        callView?.layoutView()
    }
    
    func viewWillAppearEvent() {
        callView?.animPhone()
    }
}

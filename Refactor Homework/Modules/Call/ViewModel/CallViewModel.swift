//
//  CallViewModel.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import Foundation
import UIKit

protocol CallViewModelProtocol: AnyObject {
    init(view: CallViewController, networkService: NetworkServiceMock)
    func supportCall()
    func ahimPhone()
}

final class CallViewModel {
    
    let view: CallViewController
    let networkService: NetworkServiceMock
    
    init(view: CallViewController, networkService: NetworkServiceMock) {
        self.view = view
        self.networkService = networkService
    }
    
    @objc func supportCall() {
        let alert = UIAlertController(title: "Звонок в call-центр", message: "Звонок будет произведён через приложение \"Телефон\"", preferredStyle: .actionSheet)
        
        let call = UIAlertAction(title: "Позвонить", style: .default) { (action) in
            
            self.networkService.getCallNumber { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let model):
                        guard let number = URL(string: "tel://" + model.number) else { return }
                        UIApplication.shared.open(number)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        alert.view.tintColor = .systemBlue
        alert.addAction(call)
        alert.addAction(cancel)
        
        view.present(alert, animated: true, completion: nil)
    }
    
    func animPhone() {
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [.repeat, .autoreverse]) {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 1.2, y: 1.2)
            
            self.view.phoneImageView.transform = transform
        } completion: { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.animPhone()
            }
        }
    }
}

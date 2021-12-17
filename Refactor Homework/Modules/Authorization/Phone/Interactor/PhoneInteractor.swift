//
//  PhoneInteractor.swift
//  Refactor Homework
//
//  Created by Sungur on 17.12.2021.
//

import Foundation

protocol PhoneProvider {
    init(phoneVC: PhoneEditViewController)
    func textFieldChange(text: String)
    
}

final class PhoneInteractor: PhoneProvider {
    
    let phoneVC: PhoneEditViewController
    
    init(phoneVC: PhoneEditViewController) {
        self.phoneVC = phoneVC
    }
    
    func textFieldChange(text: String) {
        if text.count == phoneVC.phonePattern.count {
            self.phoneVC.enableCodeButton(true)
            self.phoneVC.normalPhoneString = text
        } else {
            self.phoneVC.enableCodeButton(false)
        }
    }
    
    
}

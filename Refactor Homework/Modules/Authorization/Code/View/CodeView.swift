//
//  CodeView.swift
//  Refactor Homework
//
//  Created by Sungur on 08.12.2021.
//

import Foundation
import UIKit

final class СodeView: UIView , UITextFieldDelegate{
    
    let vc: CodeEditViewController
    let codeModel: Code
    let codePresenter: CodePresenter
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.vc = vc
        
        vc.view.backgroundColor = .systemBackground
        
        vc.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        vc.phoneLabel.text = "Отправлен на \(codeModel.phoneString)"
        
        vc.navigationItem.title = "Код"
        
        vc.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(vc.hideKB)))
        
        vc.view.addSubview(vc.titleLabel)
        vc.view.addSubview(vc.phoneLabel)
        vc.view.addSubview(vc.codeField)
        vc.view.addSubview(vc.continueButton)
        vc.view.addSubview(vc.alertLabel)
        vc.view.addSubview(vc.activityIndicator)
        
        vc.continueButtonBottomConstraint = vc.continueButton.bottomAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        
        NSLayoutConstraint.activate([
            vc.titleLabel.topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            vc.titleLabel.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 20),
            vc.titleLabel.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -20),
            
            vc.phoneLabel.topAnchor.constraint(equalTo: vc.titleLabel.bottomAnchor, constant: 5),
            vc.phoneLabel.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 20),
            vc.phoneLabel.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -20),
            
            vc.codeField.topAnchor.constraint(equalTo: vc.phoneLabel.bottomAnchor, constant: 8),
            vc.codeField.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 20),
            vc.codeField.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -20),
            vc.codeField.heightAnchor.constraint(equalToConstant: 42),
                        
            vc.continueButtonBottomConstraint,
            vc.continueButton.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 20),
            vc.continueButton.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -20),
            vc.continueButton.heightAnchor.constraint(equalToConstant: 44),
            
            vc.alertLabel.topAnchor.constraint(equalTo: vc.codeField.bottomAnchor, constant: 8),
            vc.alertLabel.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 20),
            
            vc.activityIndicator.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            vc.activityIndicator.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])

        vc.codeField.delegate = self
        
        vc.continueButton.addTarget(self, action: #selector(codePresenter.checkCode), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
}


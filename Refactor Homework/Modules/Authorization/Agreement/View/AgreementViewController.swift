//
//  AgreementViewController.swift
//

import UIKit

class AgreementViewController: UIViewController {
    
    let networkService: NetworkServiceMock
    let agreementPresenter: AgreementPresenter
    
    init(networkService: NetworkServiceMock, agreementPresenter: AgreementPresenter) {
        self.networkService = networkService
        self.agreementPresenter = agreementPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    let activityIndicator = UIActivityIndicatorView(style: .large)

    let agreementTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isSelectable = false
        textView.isEditable = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cоглашение"
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(agreementTextView)
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()

        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            agreementTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            agreementTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            agreementTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            agreementTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
                
        self.agreementPresenter.showAgreement()
        
    }
}

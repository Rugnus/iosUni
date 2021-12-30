//
//  CallViewController.swift
//

import UIKit

final class CallViewController: UIViewController {
        
    let networkService: NetworkServiceMock
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    let phoneImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "phone.circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let operatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Звонок в call-центр"
        label.font = .systemFont(ofSize: 21)
        return label
    }()
    
    let callView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(phoneImageView)
        view.addSubview(operatorLabel)
        view.addSubview(callView)
        
        NSLayoutConstraint.activate([
            phoneImageView.widthAnchor.constraint(equalToConstant: 137),
            phoneImageView.heightAnchor.constraint(equalTo: phoneImageView.widthAnchor),
            phoneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            phoneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            operatorLabel.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 21),
            operatorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            callView.widthAnchor.constraint(equalTo: phoneImageView.widthAnchor),
            callView.heightAnchor.constraint(equalTo: phoneImageView.heightAnchor),
            callView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            callView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CallViewModel.supportCall))
        tap.numberOfTapsRequired = 1
        callView.addGestureRecognizer(tap)

        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CallViewModel(view: CallViewController(networkService: NetworkServiceMock()), networkService: NetworkServiceMock()).animPhone()
    }
}

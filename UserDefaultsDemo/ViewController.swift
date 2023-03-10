//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Evhen Lukhtan on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {

    private let label = UILabel()
    private let textField = UITextField()
    private let button = UIButton()
    
    private let storage: StorageManagerProtocol = StorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = storage.string(forKey: .textFieldText) ?? "No data"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .blue.withAlphaComponent(0.2)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue.withAlphaComponent(0.5)
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),

            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 300),

            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    @IBAction
    func buttonAction() {
        if textField.hasText {
            print("Data saved")
            
            storage.set(textField.text, forKey: .textFieldText)
            label.text = textField.text
        }
    }
}


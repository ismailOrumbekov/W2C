//
//  SignUpViewController.swift
//  W2C
//
//  Created by Ismail Orumbekov on 11.10.2023.
//

import Foundation
import UIKit
import SnapKit

class SignUpViewController: UIViewController{
    let customUI = CustomUI()
    private lazy var cityBottomImageView : UIImageView = customUI.getIcon(name: "bottomCity")
    
    private lazy var cloudsImageView : UIImageView = customUI.getIcon(name: "clouds")
    
    private lazy var registrationImageView : UIImageView = customUI.getIcon(name: "registrationIcon")
 
    private lazy var signUpLabel: UILabel = customUI.createMainLabel(text: "Регистрация", font: 20)
    
    private lazy var cityLabel: UILabel = customUI.createTitleForField(text: "ВАШ ГОРОД")
   
    
    private lazy var cityField: UITextField = customUI.createTextField(placeholder: "Выберите свой город")
    
    
    private lazy var nameLabel: UILabel = customUI.createTitleForField(text: "ВАШЕ ФИО")
    
    
    private lazy var nameField: UITextField = customUI.createTextField(placeholder: "Напишите свое ФИО")
    
    
    private lazy var passwordLabel: UILabel = customUI.createTitleForField(text: "ПАРОЛЬ" )
    
    
    private lazy var passwordField: UITextField = customUI.createTextField(placeholder: "Придумайте пароль")
    
    
    private lazy var submitPasswordLabel: UILabel = customUI.createTitleForField(text: "ПОДТВЕРДИТЕ ПАРОЛЬ")

    
    private lazy var submitPasswordField: UITextField = customUI.createTextField(placeholder: "Подтвердите пароль")

    
    private lazy var nextButton : UIButton = customUI.createDefaultButton(text: "Далее")

    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setUpUI()
    }
    
    @objc func nextPressed(){
        let inDetailSignUpPage = inDetailSignUpViewController()
        self.navigationController?.pushViewController(inDetailSignUpPage, animated: true)
    }
    
    
}

extension SignUpViewController{
    func setUpUI(){
        addSubviews()
        addTargets()
        setUpContraints()
        passwordField.isSecureTextEntry = true
        submitPasswordField.isSecureTextEntry = true

    }
    
    func addTargets(){
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)

    }
    func addSubviews(){
        view.addSubview(cityBottomImageView)
        view.addSubview(cloudsImageView)
        view.addSubview(registrationImageView)
        view.addSubview(signUpLabel)
        view.addSubview(cityLabel)
        view.addSubview(cityField)
        view.addSubview(nameLabel)
        view.addSubview(nameField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(submitPasswordLabel)
        view.addSubview(submitPasswordField)
        view.addSubview(nextButton)
    }
    
    func setUpContraints(){
        cityBottomImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        cloudsImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        registrationImageView.snp.makeConstraints { make in
            make.top.equalTo(cloudsImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(registrationImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        
        cityField.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(cityField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        
        nameField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        submitPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        
        submitPasswordField.snp.makeConstraints { make in
            make.top.equalTo(submitPasswordLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(submitPasswordField.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
    }
}

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
    
    let cityBottomImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bottomCity"))
        return imageView
    }()
    
    let cloudsImageView : UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "clouds"))
        return imageView
    }()
    
    let registrationImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "registrationIcon"))
        return imageView
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = UIColor(named: "mainRed")
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(0.6))
        label.textAlignment = .center
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "ВАШ ГОРОД"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var cityField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Выберите свой город"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ВАШЕ ФИО"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var nameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Напишите своё ФИО"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "ПАРОЛЬ"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Придумайте пароль"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var submitPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "ПОДТВЕРДИТЬ ПАРОЛЬ"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var submitPasswordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Подтвердите пароль"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight(0.6))
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "mainRed")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        return button
    }()
    
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
        setUpContraints()
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
            make.width.equalToSuperview().multipliedBy(0.65)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
    }
}

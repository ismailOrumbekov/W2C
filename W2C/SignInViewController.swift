//
//  signInViewController.swift
//  W2C
//
//  Created by Ismail Orumbekov on 11.10.2023.
//

import Foundation
import UIKit
import SnapKit

class SignInViewController: UIViewController{
    
    let customUI = CustomUI()
    private lazy var cloudsImageView = customUI.getIcon(name: "clouds")
    private lazy var citiBottomImageView : UIImageView = customUI.getIcon(name: "bottomCity")
    
    private lazy var signInImageView : UIImageView = customUI.getIcon(name: "signInIcon")

    let studentLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial", size: 22)
        label.attributedText = NSAttributedString(string: "Student", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var signInButton : UIButton = customUI.createDefaultButton(text: "Войти")

    private lazy var phoneField : UITextField = customUI.createTextField(placeholder: "Введите почту")

    private lazy var phoneNumberLabel : UILabel = customUI.createTitleForField(text: "ПОЧТА")

    private lazy var passwordLabel : UILabel = customUI.createTitleForField(text: "Пароль")

    
    private lazy var passwordField : UITextField = customUI.createTextField(placeholder: "Пароль")

    
    
    
    private lazy var authorizationLabel : UILabel = customUI.createMainLabel(text: "Авторизоваться",
                                                                             font: 20)

    
    override func viewDidLoad() {
        setUpUI()
    }
    
    @objc func signInPressed(){
        let apartmentPage = ProfilePageViewController()
        self.navigationController?.pushViewController(apartmentPage, animated: true)
    }
}


extension SignInViewController{
    func setUpUI(){
        view.backgroundColor = .white
        addSubViews()
        setUpContrsaints()
    }
    
    func addSubViews(){
        
        view.addSubview(cloudsImageView)
        view.addSubview(citiBottomImageView)
        view.addSubview(signInImageView)
        view.addSubview(authorizationLabel)
        view.addSubview(studentLabel)
        view.addSubview(phoneField)
        view.addSubview(phoneNumberLabel)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        passwordField.isSecureTextEntry = true
        
    }
    
    func setUpContrsaints(){
        cloudsImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        authorizationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInImageView.snp.bottom).offset(20)
            
        }
        
        citiBottomImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        signInImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        
        studentLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(authorizationLabel.snp.bottom).offset(20)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(studentLabel.snp.left)
            make.top.equalTo(studentLabel.snp.bottom).offset(15)

        }
        
        phoneField.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-40)
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(5)

            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneField.snp.bottom).offset(20)
            make.left.equalTo(phoneField.snp.left)
        }
        
        passwordField.snp.makeConstraints { make in
            make.width.equalTo(phoneField.snp.width)
            make.height.equalTo(phoneField.snp.height)
            make.top.equalTo(passwordLabel.snp.bottom).offset(5)
            make.left.equalTo(phoneField.snp.left
            )
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
    }
}

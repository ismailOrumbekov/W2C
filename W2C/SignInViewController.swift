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
    
    let cloudsImageView : UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "clouds"))
        return imageView
    }()
    
    let studentLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial", size: 22)
        label.attributedText = NSAttributedString(string: "Student", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.textColor = .darkGray
        return label
    }()
    
    let signInButton : UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight(0.6))
        button.titleLabel?.textAlignment = .center

        button.backgroundColor = UIColor(named: "mainRed")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    let phoneField : UITextField = {
       let textField = UITextField()
        textField.text = "+7"
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let phoneNumberLabel : UILabel = {
       let label = UILabel()
        label.text = "Номер телефона"
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .black
        return label
    }()
    
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .black
        return label
    }()
    
    let passwordField : UITextField = {
       let textField = UITextField()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let citiBottomImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bottomCity"))
        return imageView
    }()
    
    let signInImageView : UIImageView = {
      let imageView = UIImageView(image: UIImage(named: "signInIcon"))
        return imageView
    }()
    
    let authorizationLabel : UILabel = {
       let label = UILabel()
        label.text = "Авторизоваться"
        label.textColor = UIColor(named: "mainRed")
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(0.6))
        return label
    }()
    
    override func viewDidLoad() {
        setUpUI()
    }
    
    @objc func signInPressed(){
        let apartmentPage = ApartmentsViewController()
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
            make.width.equalToSuperview().offset(-100)
            make.height.equalTo(50)
        }
    }
}

//
//  ViewController.swift
//  W2C
//
//  Created by Ismail Orumbekov on 30.09.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let text =  "saljfladnf"
    let customUI = CustomUI()
//MARK: UI variables
    private lazy var cloudsImageView = customUI.getIcon(name: "clouds")
    private lazy var logoIconView = customUI.getIcon(name: "logo")
    private lazy var cityBottomImageView = customUI.getIcon(name: "bottomCity")
    private lazy var signInButton : UIButton = customUI.createDefaultButton(text: "Войти")
    private lazy var signUpButton : UIButton = customUI.createDefaultButton(text: "Зарегистрироваться")
    private lazy var welcomeLabel : UILabel = customUI.createMainLabel(text: "Welcome to the city", font: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    
    @objc func signInPressed(){
        let signInPage = SignInViewController()
        self.navigationController?.pushViewController(signInPage, animated: true)
    }
    
    
    @objc func signUpPressed(){
        let signUpPage = SignUpViewController()
        self.navigationController?.pushViewController(signUpPage, animated: true)
    }
}


//MARK: Set up UI
extension ViewController{
    func setUpUI(){
        view.backgroundColor = .white
        addSubViews()
        setUpContrsaints()
        signInButton.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
    }
    func addSubViews(){
        view.addSubview(cloudsImageView)
        view.addSubview(logoIconView)
        view.addSubview(cityBottomImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        
    }
    
    func setUpContrsaints(){
        cityBottomImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        cloudsImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
        logoIconView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-80)
            make.width.equalToSuperview().multipliedBy(0.7) // was 300px (??)
            make.height.equalToSuperview().multipliedBy(0.2) // was 200px (??)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoIconView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(80)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.05) 
            
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.05)

        }
    }
}

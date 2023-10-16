//
//  ViewController.swift
//  W2C
//
//  Created by Ismail Orumbekov on 30.09.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let cloudsImageView : UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "clouds"))
        return imageView
    }()
    let logoIconView : UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "logo"))
        return imageView
    }()
    
    let cityBottomImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bottomCity"))
        return imageView
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
    
    let signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight(0.6))
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "mainRed")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "Welcome to the city"
        label.textColor = UIColor(named: "mainRed")
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight(0.9))
        label.textAlignment = .center
        
        return label
    }()
    
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
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoIconView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(80)
            make.width.equalToSuperview().offset(-100)
            make.height.equalTo(50)
            
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-100)
            make.height.equalTo(50)

        }
    }
}

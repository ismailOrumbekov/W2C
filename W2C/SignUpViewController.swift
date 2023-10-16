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
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setUpUI()
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
            make.center.equalToSuperview()
        }
    }
}

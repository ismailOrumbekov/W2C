//
//  ProfilePageViewController.swift
//  W2C
//
//  Created by Ismail Orumbekov on 17.10.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfilePageViewController: UIViewController{
    
    
    
    let customUI = CustomUI()
    private lazy var stackView = customUI.createCosialMediaView()
    private lazy var segmentedControl = CustomUISegmentedControl(frame: .infinite, buttonTitle: ["О себе","Отзывы","Прошлые кв"])
    
    private lazy var profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "gray")
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var fullnameLabel : UILabel = customUI.createFullnameLabel(name: "Исмаил Орумбеков")
    private lazy var ageLabel : UILabel = customUI.createAgeLabel(age: 19)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpUI()
    }

}

extension ProfilePageViewController{
    func setUpUI(){
        
        addSubviews()
        setUpContraints()
        view.backgroundColor = .white
        segmentedControl.delegate = self
    }
    
    func addSubviews(){
        print("Entered")
        view.addSubview(profileImageView)
        view.addSubview(fullnameLabel)
        view.addSubview(ageLabel)
        view.addSubview(stackView)
        segmentedControl.backgroundColor = .clear
        view.addSubview(segmentedControl)
        
    }
    
    func setUpContraints(){
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        fullnameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
        }
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fullnameLabel.snp.bottom).offset(5)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ageLabel.snp.bottom).offset(10)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
}


extension ProfilePageViewController: CustomSegmentedControlDelegate{
    func changeToIndex(index: Int) {

    }
    
    
}

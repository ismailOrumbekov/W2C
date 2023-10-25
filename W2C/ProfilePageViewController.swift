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
    
    private let sizingCell = CustomCell()
    let customUI = CustomUI()
    
    var titleList = ["О себе", "Соседи", "Плохие привычки", "Интересы"]
    var informationList = [
        "Учусь в университете имени Сулеймана Демиреля . С понедельника по пятницу с 9 до 16:00 нахожусь в университете, в 7 вечера три раза в неделю хожу в зал. Не терплю запах сигарет и алкоголь",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov"
    ]
    
    private lazy var stackView = customUI.createCosialMediaView()
    private lazy var segmentedControl = CustomUISegmentedControl(frame: .infinite, buttonTitle: ["О себе","Отзывы","Прошлые кв"])
    
    private lazy var profileImageView : UIImageView = customUI.createImageViewForProfile()
    
    private lazy var fullnameLabel : UILabel = customUI.createFullnameLabel(name: "Исмаил Орумбеков")
    private lazy var ageLabel : UILabel = customUI.createAgeLabel(age: 19)
    
    private lazy var informationCollectionView: UICollectionView = customUI.createCollectionView()
    
    
    
    
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
        segmentedControl.backgroundColor = .clear
        
    }
    
    func addSubviews(){
        print("Entered")
        view.addSubview(profileImageView)
        view.addSubview(fullnameLabel)
        view.addSubview(ageLabel)
        view.addSubview(stackView)
        view.addSubview(segmentedControl)
//        view.addSubview(informationCollectionView)
        
    }
    
    func setUpContraints(){
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
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
            make.centerX.equalToSuperview()
            make.top.equalTo(stackView).offset(70)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        informationCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
    }
}


extension ProfilePageViewController: CustomSegmentedControlDelegate{
    func changeToIndex(index: Int) {
        print(index)
    }
}


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
    
    let sizingCell = CustomCell()
    let customUI = CustomUI()
    private var switchView = UIView()
    
    var titleList = ["О себе", "Соседи", "Плохие привычки", "Интересы"]
    var informationList = [
        "Учусь в университете имени Сулеймана Демиреля . С понедельника по пятницу с 9 до 16:00 нахожусь в университете, в 7 вечера три раза в неделю хожу в зал. Не терплю запах сигарет и алкоголь",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov"
    ]
    var apartmentInfo = [
        ["3", "ул. Абая, 32А", "3,5"],
        ["3", "ул. Абая, 32А", "3,5"],
        ["3", "ул. Абая, 32А", "3,5"],
    ]
    
    private lazy var stackView = customUI.createCosialMediaView()
    private lazy var segmentedControl = CustomUISegmentedControl(frame: .infinite, buttonTitle: ["О себе","Отзывы","Прошлые кв"])
    
    private lazy var profileImageView : UIImageView = customUI.createImageViewForProfile()
    
    private lazy var fullnameLabel : UILabel = customUI.createFullnameLabel(name: "Исмаил Орумбеков")
    private lazy var ageLabel : UILabel = customUI.createAgeLabel(age: 19)
    
    private lazy var informationCollectionView: UICollectionView = customUI.createCollectionView()
    
    private lazy var listOfApartments: UITableView = customUI.createTableViewApartments()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationCollectionView.delegate = self
        informationCollectionView.dataSource = self
        listOfApartments.delegate = self
        listOfApartments.dataSource = self
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
        view.addSubview(listOfApartments)
        view.addSubview(switchView)
        switchView.addSubview(listOfApartments)
        switchView.addSubview(informationCollectionView)
        
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
        
        switchView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        listOfApartments.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
        informationCollectionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
    }
}


extension ProfilePageViewController: CustomSegmentedControlDelegate{
    func changeToIndex(index: Int) {
        print(index)
        switch index {
        case 0:
            switchView.bringSubviewToFront(informationCollectionView)
        case 2:
            switchView.bringSubviewToFront(listOfApartments)
        default:
            break
        }
        
    }
}

extension ProfilePageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apartmentInfo.count
     }
         
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: ApartmentCell.identifier, for: indexPath) as! ApartmentCell
       cell.titleOfApartment.text = "\(apartmentInfo[indexPath.item][0])-х комнатная квартира"
       cell.addressOfApartment.text = "Адрес: \(apartmentInfo[indexPath.item][1])"
       cell.ratingOfApartment.text = "Рейтинг: \(apartmentInfo[indexPath.item][2])"
         
       return cell
     }
    
}

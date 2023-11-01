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
    let feedbackDelegate = FeedbackTableDelegate()
    
    
//MARK: UI variables
    private lazy var stackView = customUI.createCosialMediaView()
    private lazy var feedbackTableView : UITableView = customUI.createTableViewForFeedbacks()
    private lazy var segmentedControl = CustomUISegmentedControl(frame: .infinite,
                                                                 buttonTitle: ["О себе","Отзывы","Прошлые кв"])
    
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
        feedbackTableView.dataSource = feedbackDelegate
        feedbackTableView.delegate = feedbackDelegate
        setUpUI()
    }
    
    
    

}


//MARK: Constraints set up
extension ProfilePageViewController{
    func setUpUI(){
        addSubviews()
        setUpContraints()
        view.backgroundColor = .white
        segmentedControl.delegate = self
        segmentedControl.backgroundColor = .clear
    }
    
    func addSubviews(){

        view.addSubview(profileImageView)
        view.addSubview(fullnameLabel)
        view.addSubview(ageLabel)
        view.addSubview(stackView)
        view.addSubview(segmentedControl)
        view.addSubview(listOfApartments)
        view.addSubview(feedbackTableView)
        view.addSubview(switchView)
        switchView.addSubview(feedbackTableView)
        switchView.addSubview(listOfApartments)
        switchView.addSubview(informationCollectionView)
        feedbackTableView.isHidden = true
        listOfApartments.isHidden = true
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
        
        feedbackTableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
//
    }
}



//MARK: Segmented control set ups
extension ProfilePageViewController: CustomSegmentedControlDelegate{
    func changeToIndex(index: Int) {
        switch index {
        case 0:
            informationCollectionView.isHidden = false
            feedbackTableView.isHidden = true
            listOfApartments.isHidden = true
            switchView.bringSubviewToFront(informationCollectionView)
        case 1:
            feedbackTableView.isHidden = false
            listOfApartments.isHidden = true
            informationCollectionView.isHidden = true
            switchView.bringSubviewToFront(feedbackTableView)
        case 2:
            listOfApartments.isHidden = false
            informationCollectionView.isHidden = true
            feedbackTableView.isHidden = true
            switchView.bringSubviewToFront(listOfApartments)
        default:
            break
        }
        
    }
}


extension ProfilePageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Variables.apartmentsForProfile.count
     }
         
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: ApartmentCell.identifier, for: indexPath) as! ApartmentCell
       let apartment = Variables.apartmentsForProfile[indexPath.item]
       cell.titleOfApartment.text = "\(apartment.numberOfRooms)-х комнатная квартира"
       cell.addressOfApartment.text = "Адрес: \(apartment.adress)"
       cell.ratingOfApartment.text = "Рейтинг: \(apartment.rating)"
         
       return cell
     }
    
}

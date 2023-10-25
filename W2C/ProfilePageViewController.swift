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
        "Учусь в университете имени Сулеймана Демиреля . С понедельника по пятницу с 9 до 16:00 нахожусь в университете, в 7 вечера три раза в неделю хожу в зал. Не терплю запах сигарет и алкогольУчусь в университете имени Сулеймана Демиреля . С понедельника по пятницу с 9 до 16:00 нахожусь в университете, в 7 вечера три раза в неделю хожу в зал. Не терплю запах сигарет и алкогольУчусь в университете имени Сулеймана Демиреля . С понедельника по пятницу с 9 до 16:00 нахожусь в университете, в 7 вечера три раза в неделю хожу в зал. Не терплю запах сигарет и алкоголь",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov"
    ]
    
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
    
    private lazy var informationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        return collectionView
    }()
    
    
    
    
    
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
        view.addSubview(informationCollectionView)
        
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


extension ProfilePageViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.titleLabel.text = titleList[indexPath.item]
        cell.informationLabel.text = informationList[indexPath.item]
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        4
    }
    
}

extension ProfilePageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let isSelected = collectionView.indexPathsForSelectedItems?.contains(indexPath) ?? false
        
        sizingCell.frame = CGRect(
            origin: .zero,
            size: CGSize(width: collectionView.bounds.width - 40, height: 1000)
        )
        
        sizingCell.isSelected = isSelected
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()

        let size = sizingCell.systemLayoutSizeFitting(
            CGSize(width: collectionView.bounds.width - 40, height: .greatestFiniteMagnitude),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )

        return size
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        24
    }
    
}

extension ProfilePageViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionView.performBatchUpdates(nil)
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        collectionView.performBatchUpdates(nil)
        
        DispatchQueue.main.async {
            guard let attributes = collectionView.collectionViewLayout.layoutAttributesForItem(at: indexPath) else {
                return
            }

            let desiredOffset = attributes.frame.origin.y - 20
            let contentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
            let maxPossibleOffset = contentHeight - collectionView.bounds.height
            let finalOffset = max(min(desiredOffset, maxPossibleOffset), 0)

            collectionView.setContentOffset(
                CGPoint(x: 0, y: finalOffset),
                animated: true
            )
            
        }
        for (index, cell) in collectionView.visibleCells.enumerated() {
            if let customCell = cell as? CustomCell {
                customCell.isSelected = index == indexPath.item
                if index != indexPath.item {
                    collectionView.deselectItem(at: IndexPath(item: index, section: 0), animated: true)
                    collectionView.performBatchUpdates(nil)
                }
            }
        }
        
        return true
    }
    
}


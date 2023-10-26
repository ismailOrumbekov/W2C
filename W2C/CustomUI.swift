//
//  CustomUI.swift
//  W2C
//
//  Created by Ismail Orumbekov on 17.10.2023.
//

import Foundation
import UIKit
import SnapKit

struct CustomUI{
    func printText() -> String{
        return "text"
    }
    
    func createDefaultButton(text: String) -> UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight(0.6))
        button.titleLabel?.textAlignment = .center

        button.backgroundColor = UIColor(named: "mainRed")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }
    
    func createMainLabel(text: String, font: CGFloat) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(named: "mainRed")
        label.font = UIFont.systemFont(ofSize: font, weight: UIFont.Weight(0.9))
        label.textAlignment = .center
        
        return label
    }
    
    func createTextField(placeholder: String) -> UITextField{
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }
    
    func createTitleForField(text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }
    
    func createFullnameLabel(name: String) -> UILabel{
        let label = UILabel()
        label.text = name
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(0.3))
        return label
    }
    
    func createAgeLabel(age: Int) ->UILabel{
        let label = UILabel()
        label.text = "\(String(age)) лет"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(0.3))
        return label
    }
    
    func createCosialMediaView() -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "instagramIcon")
        
        let imageView1 = UIImageView()
        imageView1.image = UIImage(named: "facebookIcon")
        
        let imageView3 = UIImageView()
        imageView3.image = UIImage(named: "telegramIcon")
        
        imageView1.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        imageView2.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        imageView3.snp.makeConstraints { make in
            make.height.equalTo(27)
            make.width.equalTo(27)
        }
        
        stackView.addArrangedSubview(imageView1)
        stackView.addArrangedSubview(imageView2)
        stackView.addArrangedSubview(imageView3)
        
        return stackView
    }
    
    func createCollectionView() -> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = true
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        return collectionView
    }
    
    func createTableViewApartments() -> UITableView{
        let tableView = UITableView()
        tableView.separatorColor = UIColor.clear
        tableView.register(ApartmentCell.self, forCellReuseIdentifier: ApartmentCell.identifier)
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
    
    func createImageViewForProfile() -> UIImageView{
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "gray")
        imageView.layer.cornerRadius = 10
        return imageView
    }
    
    func getIcon(name: String) -> UIImageView{
        let imageView = UIImageView(image: UIImage(named: name))
        return imageView
    }
    
   
}



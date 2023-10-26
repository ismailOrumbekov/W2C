//
//  ApartmentCellTableView.swift
//  W2C
//
//  Created by Arapbay Sungat on 25.10.2023.
//

import Foundation
import UIKit
import SnapKit

class ApartmentCell: UITableViewCell {
    static let identifier = "ApartmentCell"
    
    private lazy var viewOfAparmentsInfo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "mainRed")
        return view
    }()
    
    lazy var imageOfAparmentView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "gray")
//        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var titleOfApartment: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var addressOfApartment: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 13)
        label.textColor = .white
        label.text = "Address"
        return label
    }()
    
    lazy var ratingOfApartment: UILabel = {
        let label = UILabel()
        label.text = "Rating: 5.0"
        label.textColor = .white
        label.font = UIFont(name: "Arial", size: 13)
        return label
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        viewOfAparmentsInfo.layer.cornerRadius = 10
        viewOfAparmentsInfo.clipsToBounds = true
        imageOfAparmentView.layer.cornerRadius = 10
        imageOfAparmentView.clipsToBounds = true
    }
}

extension ApartmentCell {
    
    func setupUI() {
        setupVC()
        setupView()
    }
    
    func setupVC() {
        contentView.addSubview(viewOfAparmentsInfo)
        viewOfAparmentsInfo.addSubview(imageOfAparmentView)
        viewOfAparmentsInfo.addSubview(titleOfApartment)
        viewOfAparmentsInfo.addSubview(addressOfApartment)
        viewOfAparmentsInfo.addSubview(ratingOfApartment)
        
    }
    
    func setupView() {
        viewOfAparmentsInfo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageOfAparmentView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.72)
            make.width.equalToSuperview().multipliedBy(0.23)
        }
        
        titleOfApartment.snp.makeConstraints { make in
            make.left.equalTo(imageOfAparmentView.snp.right).offset(50)
            make.top.equalToSuperview().offset(30)
        }
        
        addressOfApartment.snp.makeConstraints { make in
            make.top.equalTo(titleOfApartment.snp.bottom).offset(10)
            make.left.equalTo(imageOfAparmentView.snp.right).offset(50)
        }
        
        ratingOfApartment.snp.makeConstraints { make in
            make.top.equalTo(addressOfApartment.snp.bottom).offset(10)
            make.left.equalTo(imageOfAparmentView.snp.right).offset(50)
        }
    }
    
}

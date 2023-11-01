//
//  testTableView.swift
//  W2C
//
//  Created by Ismail Orumbekov on 25.10.2023.
//

import Foundation


import UIKit

class MyTableViewCell: UITableViewCell {
    let customUI = CustomUI()
    private lazy var starsImageView : UIImageView = {
       let imageV = UIImageView()
        imageV.image = UIImage(named: "3stars")
        return imageV
    }()
    private lazy var commentsLabel = customUI.createHaveCommentsLabel()
    
    private lazy var dateLabel = customUI.createDateLabel()
    
    static let identifier = "MyTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "mainRed")
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews(){
        addSubview(dateLabel)
        addSubview(commentsLabel)
        addSubview(starsImageView)
    }
    
    func setUpConstraints(){
        starsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(5)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(starsImageView.snp.top)
            
        }
        commentsLabel.snp.makeConstraints { make in
            make.left.equalTo(dateLabel.snp.left)
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
        }
    }
    
    func setInfo(startDate: String, endDate: String, grade: Int, haveCommens: Bool){
        dateLabel.text = startDate + " - " + endDate
        if(haveCommens){
            commentsLabel.text = "Есть комментарии"
        }else{
            commentsLabel.text = "Нет комментариев"
        }
    }
    
}


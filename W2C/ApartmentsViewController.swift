//
//  apartmentsViewController.swift
//  W2C
//
//  Created by Ismail Orumbekov on 11.10.2023.
//

import Foundation
import UIKit
import SnapKit

class ApartmentsViewController: UIViewController{
    
    let customUI = CustomUI()
    
    private lazy var tableView = customUI.createTableViewApartments()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)

        view.backgroundColor = .white
        setUpUI()
        
    }
}



extension ApartmentsViewController{
    func setUpUI(){

        addSubviews()
        setUpConstraints()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func addSubviews(){
        view.addSubview(tableView)
    }
    
    func setUpConstraints(){
        tableView.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.left.right.equalToSuperview() // Чтобы ширина была равной ширине view
                make.bottom.equalTo(view.safeAreaLayoutGuide)
            }
    }
}


extension ApartmentsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Variables.allApartments.count
     }
         
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: ApartmentCell.identifier, for: indexPath) as! ApartmentCell
       cell.setColors()
       let apartment = Variables.allApartments[indexPath.item]
       cell.titleOfApartment.text = "\(apartment.numberOfRooms)-х комнатная квартира"
       cell.addressOfApartment.text = "Адрес: \(apartment.adress)"
       cell.ratingOfApartment.text = "Рейтинг: \(apartment.rating)"
         print("cell")
       return cell
     }
    
}

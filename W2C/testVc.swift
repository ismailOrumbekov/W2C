//
//  test.swift
//  W2C
//
//  Created by Ismail Orumbekov on 25.10.2023.
//

import Foundation

import UIKit

class testViewController: UIViewController {
     var feedbacks : [Feedback] = [
        Feedback(grade: 3, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells"),
        Feedback(grade: 1, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells"),
        Feedback(grade: 2, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells"),
        Feedback(grade: 5, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells")
    ]
    let customUI = CustomUI()
    private lazy var feedbackTableView : UITableView = customUI.createTableViewForFeedbacks()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(feedbackTableView)

        feedbackTableView.dataSource = self
        feedbackTableView.delegate = self
        view.backgroundColor = .white
        feedbackTableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        setUpContraints()
    }
    
    func setUpContraints(){
        feedbackTableView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(400)
        }
    }


}

extension testViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        let feedback = feedbacks[indexPath.item]
        cell.setInfo(startDate: feedback.startDate, endDate: feedback.endDate, grade: feedback.grade, haveCommens: feedback.haveComments)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

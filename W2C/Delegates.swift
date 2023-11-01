//
//  Delegates.swift
//  W2C
//
//  Created by Ismail Orumbekov on 26.10.2023.
//

import Foundation
import UIKit

class FeedbackTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Variables.feedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        let feedback = Variables.feedbacks[indexPath.item]
        cell.setInfo(startDate: feedback.startDate, endDate: feedback.endDate, grade: feedback.grade, haveCommens: feedback.haveComments)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

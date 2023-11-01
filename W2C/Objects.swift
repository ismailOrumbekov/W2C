//
//  Objects.swift
//  W2C
//
//  Created by Ismail Orumbekov on 25.10.2023.
//

import Foundation
import UIKit


class User {
    var firstName = String()
    var secondName = String()
    var email = String()
    var gender = String()
    var age = String()
}


class Student: User{
    var university = String()
    var aboutStudent = String()
    var badHabbits = String()
    var interests = String()
    var feedbacks = [Feedback]()
}


struct Feedback{
    var grade = Int()
    var startDate = String()
    var endDate = String()
    var haveComments = Bool()
    var comments = String()
}


struct Apartment{
    var district = String()
    var adress = String()
    var numberOfRooms = Int()
    var rating = Double()
    var aboutApartment = String()
}


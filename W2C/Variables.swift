//
//  Variables.swift
//  W2C
//
//  Created by Ismail Orumbekov on 27.10.2023.
//

import Foundation

class Variables {
    static var feedbacks : [Feedback] = [
        Feedback(grade: 3, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells"),
        Feedback(grade: 1, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells"),
        Feedback(grade: 2, startDate: "2023.8.23", endDate: "2023.10.23", haveComments: true, comments: "shit smells")
    ]
   static var titleList = ["О себе", "Соседи", "Плохие привычки", "Интересы"]
   static var informationList = [
        "Учусь в университете имени Сулеймана Демиреля . С понедельника по пятницу с 9 до 16:00 нахожусь в университете, в 7 вечера три раза в неделю хожу в зал. Не терплю запах сигарет и алкоголь",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov",
        "- Sungat Arapbay \n- Ismail Orumbekov \n- Beka Chauvbayev \n- Alzhan Zhakypov"
    ]
    
    static var apartmentsForProfile = [
    Apartment(district: "Ауэзовский", adress:" Аксай 2, 23", numberOfRooms: 2, rating: 3,
              aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
    Apartment(district: "Алмалински ", adress:" Момышулы 3", numberOfRooms: 2, rating: 5,
              aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
    Apartment(district: "Медеуский", adress:"Достык 34", numberOfRooms: 3, rating: 1.4,
              aboutApartment: "Все хорошо"),
    Apartment(district: "Турксибский", adress:"Пятилетка 32", numberOfRooms: 1, rating: 2.5,
              aboutApartment: "Чисто, немного шумный район"),
    ]
    
    static var allApartments = [
        Apartment(district: "Ауэзовский", adress:" Аксай 2, 23", numberOfRooms: 2, rating: 3,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Алмалински ", adress:" Момышулы 3", numberOfRooms: 2, rating: 5,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Медеуский", adress:"Достык 34", numberOfRooms: 3, rating: 1.4,
                  aboutApartment: "Все хорошо"),
        Apartment(district: "Турксибский", adress:"Пятилетка 32", numberOfRooms: 1, rating: 2.5,
                  aboutApartment: "Чисто, немного шумный район"),
        Apartment(district: "Ауэзовский", adress:" Аксай 2, 23", numberOfRooms: 2, rating: 3,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Алмалински ", adress:" Момышулы 3", numberOfRooms: 2, rating: 5,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Медеуский", adress:"Достык 34", numberOfRooms: 3, rating: 1.4,
                  aboutApartment: "Все хорошо"),
        Apartment(district: "Турксибский", adress:"Пятилетка 32", numberOfRooms: 1, rating: 2.5,
                  aboutApartment: "Чисто, немного шумный район"),
        Apartment(district: "Ауэзовский", adress:" Аксай 2, 23", numberOfRooms: 2, rating: 3,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Алмалински ", adress:" Момышулы 3", numberOfRooms: 2, rating: 5,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Медеуский", adress:"Достык 34", numberOfRooms: 3, rating: 1.4,
                  aboutApartment: "Все хорошо"),
        Apartment(district: "Турксибский", adress:"Пятилетка 32", numberOfRooms: 1, rating: 2.5,
                  aboutApartment: "Чисто, немного шумный район"),
        Apartment(district: "Ауэзовский", adress:" Аксай 2, 23", numberOfRooms: 2, rating: 3,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Алмалински ", adress:" Момышулы 3", numberOfRooms: 2, rating: 5,
                  aboutApartment: "Квартира в хорошем районе. Все в шаговой доступности"),
        Apartment(district: "Медеуский", adress:"Достык 34", numberOfRooms: 3, rating: 1.4,
                  aboutApartment: "Все хорошо"),
        Apartment(district: "Турксибский", adress:"Пятилетка 32", numberOfRooms: 1, rating: 2.5,
                  aboutApartment: "Чисто, немного шумный район")
    ]

}

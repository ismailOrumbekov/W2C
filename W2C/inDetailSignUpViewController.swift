//
//  inDetailSignUpViewController.swift
//  W2C
//
//  Created by Arapbay Sungat on 16.10.2023.
//

import UIKit
import SnapKit

class inDetailSignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let degreeArray = ["Баклавриат", "Магистратура", "Докторантура"]
    
    
    private lazy var cityBottomImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bottomCity"))
        return imageView
    }()
    
    private lazy var registrationImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "registrationIcon"))
        return imageView
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = UIColor(named: "mainRed")
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(0.6))
        label.textAlignment = .center
        return label
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "НОМЕР ТЕЛЕФОНА"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var phoneNumberField: UITextField = {
        let textField = UITextField()
        textField.text = "+7"
        textField.layer.borderWidth = 1
        textField.keyboardType = .phonePad
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "ВОЗРАСТ"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var ageField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Напишите свой возраст"
        textField.layer.borderWidth = 1
        textField.keyboardType = .phonePad
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var universityLabel: UILabel = {
        let label = UILabel()
        label.text = "УНИВЕРСИТЕТ"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var universityField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Напишите свой университет"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var degreePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "СТЕПЕНЬ"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var degreeField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Выберите степень"
        textField.inputView = degreePicker
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var courseLabel: UILabel = {
        let label = UILabel()
        label.text = "КУРС"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var courseField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Напишите свой курс"
        textField.keyboardType = .phonePad
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "СТУДЕНЧЕСКАЯ ID-КАРТА"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var idField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Загрузите свою карту"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray2.cgColor
        textField.layer.cornerRadius = 4
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "ПОЛ"
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight(0.1))
        label.textAlignment = .left
        return label
    }()
    
    private lazy var genderRadioButtons: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Мужской", "Женский"])
        return segmentControl
    }()
    
    private lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight(0.6))
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "mainRed")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return degreeArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return degreeArray[row]
    }
    
}

private extension inDetailSignUpViewController {
    func setupUI() {
        view.backgroundColor = .white
        setupView()
        setupVC()
    }
    func setupView() {
        view.addSubview(cityBottomImageView)
        view.addSubview(registrationImageView)
        view.addSubview(signUpLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberField)
        view.addSubview(ageLabel)
        view.addSubview(ageField)
        view.addSubview(universityLabel)
        view.addSubview(universityField)
        view.addSubview(degreeLabel)
        view.addSubview(degreeField)
        view.addSubview(courseLabel)
        view.addSubview(courseField)
        view.addSubview(idLabel)
        view.addSubview(idField)
        view.addSubview(genderLabel)
        view.addSubview(genderRadioButtons)
        view.addSubview(nextButton)
    }
    func setupVC() {
        cityBottomImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        registrationImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(registrationImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        
        phoneNumberField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        ageField.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        universityLabel.snp.makeConstraints { make in
            make.top.equalTo(ageField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        universityField.snp.makeConstraints { make in
            make.top.equalTo(universityLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        degreeLabel.snp.makeConstraints { make in
            make.top.equalTo(universityField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        degreeField.snp.makeConstraints { make in
            make.top.equalTo(degreeLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        courseLabel.snp.makeConstraints { make in
            make.top.equalTo(degreeField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        courseField.snp.makeConstraints { make in
            make.top.equalTo(courseLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(courseField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        idField.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(idField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(25)
        }
        genderRadioButtons.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.04)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(genderRadioButtons.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
    }
}

//
//  CustomUISegmentedControl.swift
//  W2C
//
//  Created by Ismail Orumbekov on 17.10.2023.
//

import Foundation
import UIKit
class CustomUISegmentedControl: UIView{
    private var buttonTitles: [String]!
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    weak var delegate : CustomSegmentedControlDelegate?
    
    var textcolor:UIColor = .black
    var selectorViewColor: UIColor = UIColor(named: "mainRed")!
    var selectorTextColor: UIColor = UIColor(named: "mainRed")!
    
    private func configStackView( ) {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles{
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(CustomUISegmentedControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textcolor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton){
        for (buttonIndex, btn) in buttons.enumerated(){
            btn.setTitleColor(textcolor, for: .normal)
            if btn == sender{
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                if (delegate != nil){
                    print("entered in obj")
                    delegate?.changeToIndex(index: buttonIndex)
                }
                UIView.animate(withDuration: 0.3){
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    private func updateView(){
        createButton()
        configSelectorView()
        configStackView()
    }
    
    convenience  init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    func setButtonTitles(buttonTitles: [String]){
        self.buttonTitles = buttonTitles
        updateView()
    }
}




protocol CustomSegmentedControlDelegate: AnyObject{
    func changeToIndex(index: Int)
}

//
//  CustomSegmentControll.swift
//  CustomSegmentControll
//
//  Created by sreekanth reddy iragam reddy on 8/5/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class CustomSegmentControll: UIControl {
    var buttonsArray = [UIButton]()
    var selector:UIView!
    var selectedIndex = 0;
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
       layer.cornerRadius = frame.height/2 
       setTheView()
    }

    @IBInspectable
    var titlesList:String = "" {
        didSet {
            setTheView()
        }
    }
    
    @IBInspectable
    var borderWidth:CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
        
    }
    @IBInspectable
    var borderColor:UIColor = .white {
        
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
        
    }
    @IBInspectable
    var textColor:UIColor = .black {
        didSet{
            setTheView()
        }
    }
    
    
    @IBInspectable
    var selectorBackgroundColor:UIColor = .white {
        didSet{
            setTheView()
        }
    }
    
    @IBInspectable
    var selectorTextColor:UIColor = .white {
        didSet{
            setTheView()
        }
    }
    
//    override func layoutSubviews() {
//         layer.cornerRadius = frame.height/2
//    }
//    
    func setTheView() {
        buttonsArray.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        let buttonTitles = titlesList.components(separatedBy: "|")
        for title in buttonTitles {
            let button = UIButton(type:.system)
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttonsArray.append(button)
        }
        let selectoWidth = frame.width/CGFloat(buttonTitles.count)
        print(frame.width)
        print(selectoWidth)
        selector = UIView(frame:CGRect(x: 0, y: 0, width: selectoWidth, height: frame.height))
        selector.backgroundColor = selectorBackgroundColor
        selector.layer.cornerRadius = frame.height/2
        addSubview(selector)

        
        
        let stackView:UIStackView = UIStackView(arrangedSubviews: buttonsArray)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
        
    }
    
    func buttonTapped(button:UIButton) {
        
        for (buttonIndex,btn) in buttonsArray.enumerated() {
             btn.setTitleColor(textColor, for: .normal)
            if(btn == button) {
                selectedIndex = buttonIndex
                btn.setTitleColor(selectorTextColor, for: .normal)
                
                let selectorXOrigin = frame.width/CGFloat(buttonsArray.count) * CGFloat(buttonIndex)
                print(frame.width)
                print(buttonsArray.count)
                print(buttonIndex)
                print("selector x origin  \(frame.width/CGFloat(buttonsArray.count))")
                print(selectorXOrigin)
                UIView.animate(withDuration:
                    0.4, animations: { 
                      self.selector.frame.origin.x = selectorXOrigin
                      print("inside the selectors")
                      print(self.selector.frame.width)
                      print(self.selector.frame.origin.x)
                })
            
            }
        }
        
        sendActions(for: .valueChanged)
    }

    
    
    

}

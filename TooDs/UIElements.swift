//
//  UIElements.swift
//  TooDs
//
//  Created by Asem Okby on 6.07.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//

import UIKit

class UIElements{
    
    static let addItemButton:UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.4267933833, green: 0.7647058824, blue: 0.2383199961, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.setTitle("Add", for: .normal)
        //        button.addTarget(button, action: #selector(addItem), for: .touchUpInside)
        return button
    }()
    
    
    static let textFieldAddItem: UITextField = {
        let txtAdd = UITextField()
        txtAdd.placeholder = "Add a TooD.."
        txtAdd.translatesAutoresizingMaskIntoConstraints = false
        txtAdd.borderRect(forBounds: txtAdd.frame)
        txtAdd.backgroundColor = UIColor.white
        txtAdd.layer.borderWidth = 1
        txtAdd.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        txtAdd.layer.cornerRadius = 10
        txtAdd.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 28))
        txtAdd.leftViewMode = .always
        return txtAdd
    }()
    
    
    static let deleteAllButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.setTitle("Delete All", for: .normal)
        return button
    }()
    
    
    
    
    static func positionAddItemButton(tableTopAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>){
        addItemButton.widthAnchor.constraint(equalTo: textFieldAddItem.heightAnchor).isActive = true
        addItemButton.heightAnchor.constraint(equalTo: textFieldAddItem.heightAnchor).isActive = true
        addItemButton.leftAnchor.constraint(equalTo: textFieldAddItem.rightAnchor, constant: 10).isActive = true
        addItemButton.bottomAnchor.constraint(equalTo: tableTopAnchor, constant: -20).isActive = true
    }
    
    static func textFieldPosition(viewWidthAnchor: NSLayoutDimension, viewLeftAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, tableTopAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>){
        textFieldAddItem.bottomAnchor.constraint(equalTo: tableTopAnchor, constant: -20).isActive = true
        textFieldAddItem.widthAnchor.constraint(equalTo: viewWidthAnchor, constant: -100).isActive = true
        textFieldAddItem.leftAnchor.constraint(equalTo:viewLeftAnchor, constant: 20).isActive = true
        textFieldAddItem.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    static func positiondeleteAllButton(viewWidthAnchor: NSLayoutDimension, viewCenterXAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, tableTopAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>){
        deleteAllButton.widthAnchor.constraint(equalTo: viewWidthAnchor, constant:-50).isActive = true
        deleteAllButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        deleteAllButton.bottomAnchor.constraint(equalTo: tableTopAnchor, constant: -20).isActive = true
        deleteAllButton.centerXAnchor.constraint(equalTo:  viewCenterXAnchor).isActive = true
    }
    
    
    static func setNavigationBarTitle(navigationController: UINavigationController, navItem: UINavigationItem){
        let font = UIFont(name: "MarkerFelt-Wide" , size: 26.0)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: font!, NSAttributedString.Key.foregroundColor: UIColor(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
        navItem.title = "TooDs"
        
    }
    
    static func fontToUse() -> UIFont{
        let font = UIFont(name: "GillSans-SemiBold" , size: 20.0)
        let metrics = UIFontMetrics(forTextStyle: .body)
        let fontToUse = metrics.scaledFont(for: font!)
        return fontToUse
    }
    
    
    static func checkedboxImage() -> UIButton{
        let checkedboxImage = UIImage(named:"checkedbox.png")
        let checkedboxButton = UIButton(type:.custom)
        checkedboxButton.setImage(checkedboxImage, for: .normal)
        checkedboxButton.sizeToFit()
        return checkedboxButton
    }
    
    
}

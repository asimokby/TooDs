//
//  toDoViewController.swift
//  TooDs
//
//  Created by Asem Okby on 29.06.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//

import UIKit
import CoreData

class toDoViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    
    //UIElements 
    var toDoTableView:UITableView = UITableView()
    let addItemButton = UIElements.addItemButton
    let textFieldAddItem = UIElements.textFieldAddItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background to white
        view.backgroundColor = UIColor.white
        
        //fetch to-do toods from container
        ToodApp.toDoToods = ToodApp.fetchToDoToods()
        
        //setting navtopbar title
        if let navc = navigationController{
            UIElements.setNavigationBarTitle(navigationController: navc, navItem: navigationItem)
        }
        
        //add target for the button addItem
        addItemButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        
        //adding a tab gesture for the view, when tapped outside hte textfield, the keyboard will be dismissed
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
        
        //adding uielements and positioning them
        toDoTableView.frame = CGRect(x: 10, y: 210, width: view.frame.width-30, height: view.frame.height)
        self.view.addSubview(toDoTableView)
        toDoTableView.tableFooterView = UIView()
        toDoTableView.dataSource = self
        toDoTableView.delegate = self
        
        self.view.addSubview(textFieldAddItem)
        UIElements.textFieldPosition(viewWidthAnchor: view.widthAnchor, viewLeftAnchor: view.leftAnchor, tableTopAnchor: self.toDoTableView.topAnchor)
        textFieldAddItem.resignFirstResponder()
        textFieldAddItem.delegate = self
        
        self.view.addSubview(addItemButton)
        UIElements.positionAddItemButton(tableTopAnchor: self.toDoTableView.topAnchor)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToodApp.toDoToods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        }
        if ToodApp.toDoToods.count > 0 {
            if ToodApp.toDoToods.count == ToodApp.toDoToods.count{
            }
            cell?.textLabel?.font = UIElements.fontToUse()
            cell?.textLabel?.text = String(ToodApp.toDoToods[indexPath.row].tood!)
            //setting uncheckedbox image
            let uncheckedboxImage = UIImage(named:"uncheckedbox.png")
            let uncheckedboxButton = UIButton(type:.custom)
            uncheckedboxButton.setImage(uncheckedboxImage, for: .normal)
            uncheckedboxButton.sizeToFit()
            cell?.accessoryView = uncheckedboxButton
            uncheckedboxButton.addTarget(self, action: #selector(checkboxFunc), for: UIControl.Event.touchUpInside)
        }
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    //deleting toods from the table view(swap to delete)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ToodApp.deleteTood(rowVal: indexPath.row)
            toDoTableView.beginUpdates()
            toDoTableView.deleteRows(at: [indexPath], with: .fade)
            toDoTableView.endUpdates()
        }
    }
    
    @objc func addItem(sender: UIButton){
        textFieldAddItem.resignFirstResponder()
        if textFieldAddItem.text?.isEmpty ?? true {
            return
        }else{
            ToodApp.AddTood(toodToAdd: textFieldAddItem.text!)
            toDoTableView.reloadData()
            textFieldAddItem.text = ""
        }
    }
    
    @objc func dismissKeyboard(){
        textFieldAddItem.endEditing(true)
    }
    
    //    UItextfield delegete method. when return is hit, the keyboard is dismised
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldAddItem.resignFirstResponder()
        return true
    }
    
    @objc func checkboxFunc(sender: UIButton) -> UITableViewCell {
        //Convertint a point from the coordinate space of the checkbox to the tableView coordinate space.
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.toDoTableView)
        //index path of a CGPoint
        let indexPath = self.toDoTableView.indexPathForRow(at: buttonPosition)
        //getting the cell at the specific index and setting its checked image
        let cell = toDoTableView.cellForRow(at: indexPath!)
        cell?.accessoryView = UIElements.checkedboxImage()
        ToodApp.checkTood(rowVal: indexPath!.row)
        //delete rows of the checked rows
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
            self.toDoTableView.beginUpdates()
            self.toDoTableView.deleteRows(at: [indexPath!], with: .automatic)
            self.toDoTableView.endUpdates()
        }
        return cell!
    }
    
}

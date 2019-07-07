//
//  doneViewController.swift
//  TooDs
//
//  Created by Asem Okby on 1.07.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//

import UIKit
import CoreData

class doneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //UIElements
    var doneTableView:UITableView = UITableView()
    let deleteAllButton = UIElements.deleteAllButton
    
    
    // when done controller appears, the table is reloaded.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        doneTableView.reloadData()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        //fetching done toods from the container
        ToodApp.fetchDoneToods()
        //target for delete all button
        deleteAllButton.addTarget(self, action: #selector(deleteAll), for: .touchUpInside)
        
        //setting navbar title
        if let navc = navigationController{
            UIElements.setNavigationBarTitle(navigationController: navc, navItem: navigationItem)
        }
        
        //adding uielements and positioning them
        doneTableView.frame = CGRect(x: 10, y: 210, width: view.frame.width-30, height: view.frame.height)
        self.view.addSubview(doneTableView)
        doneTableView.tableFooterView = UIView()
        doneTableView.dataSource = self
        doneTableView.delegate = self
        
        self.view.addSubview(deleteAllButton)
        UIElements.positiondeleteAllButton(viewWidthAnchor: view.widthAnchor, viewCenterXAnchor: view.centerXAnchor, tableTopAnchor: doneTableView.topAnchor)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToodApp.doneToods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        }
        if ToodApp.doneToods.count > 0 {
            if ToodApp.doneToods.count == ToodApp.doneToods.count{
                
            }
            
            cell?.textLabel?.font = UIElements.fontToUse()
            //setting attributes of the text in the cell
            let attributedText = NSAttributedString(string: String(ToodApp.doneToods[indexPath.row].tood!), attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            cell?.textLabel?.attributedText = attributedText
            cell?.accessoryView = UIElements.checkedboxImage()
            
        }
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    @objc func deleteAll(sender: UIButton){
        ToodApp.deleteAll()
        self.doneTableView.reloadData()
    }
    
}

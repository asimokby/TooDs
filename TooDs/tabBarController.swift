//
//  tabBar.swift
//  TooDs
//
//  Created by Asem Okby on 1.07.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//

import UIKit

class tabBarController: UITabBarController {
    override func viewDidLoad() {
        //setting the two toDo and done controllers with UInavigationControllers(containerView)
        let toDoController = UINavigationController(rootViewController: toDoViewController())
        toDoController.tabBarItem.title = "To-Do"
        let doneController = UINavigationController(rootViewController: doneViewController())
        doneController.tabBarItem.title = "Done"
        //the root view controllers displayed by the tab bar interface.
        viewControllers = [toDoController, doneController]
    }
}

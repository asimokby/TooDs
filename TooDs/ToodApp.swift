//
//  ToodApp.swift
//  TooDs
//
//  Created by Asem Okby on 5.07.2019.
//  Copyright © 2019 Asem Okby. All rights reserved.
//

import UIKit
import CoreData


class ToodApp {
    static var toDoToods = [Tood]()
    static var doneToods = [DoneTood]()
    
    static func AddTood(toodToAdd: String){
        //creating a Tood object and saving it to the container
        let toodSave = Tood(context: saveTooDs.persistentContainer.viewContext)
        toodSave.tood = toodToAdd
        saveTooDs.saveContext()
        
        //appending a tood object to the array of Tood objects
        toDoToods.append(toodSave)
    }
    
    static func deleteTood(rowVal: Int){
        //deleting Tood object from the container
        let obj = ToodApp.toDoToods[rowVal]
        saveTooDs.persistentContainer.viewContext.delete(obj)
        
        //deleting a Tood object from the array
        ToodApp.toDoToods.remove(at: rowVal)
    }
    
    static func checkTood(rowVal: Int){
        //getting the checked Tood object
        let obj = ToodApp.toDoToods[rowVal]
        
        //creating a DoneTood object and saving it to the container
        let toodSave = DoneTood(context: saveTooDs.persistentContainer.viewContext)
        toodSave.tood = obj.tood
        saveTooDs.saveContext()
        
        //appending the DoneTood object to doneToods array
        ToodApp.doneToods.append(toodSave)
        
        //deleting the Tood object from the container, and the toDoToods array
        saveTooDs.persistentContainer.viewContext.delete(obj)
        ToodApp.toDoToods.remove(at: rowVal)
    }
    
    static func deleteAll(){
        //removing all DoneTood objects from the doneToods array
        ToodApp.doneToods.removeAll()
        
        //try fetching DoneTood objects and delete all of them
        let fetchedToods = fetchToDoToods()
        for obj in fetchedToods{
            saveTooDs.context.delete(obj)
        }
    }
        static func fetchDoneToods(){
            do {
                let fetchRequest: NSFetchRequest<DoneTood> =  DoneTood.fetchRequest()
                let fetchedToods = try saveTooDs.context.fetch(fetchRequest)
                ToodApp.doneToods = fetchedToods
            }catch{}
            
        }
        
        static func fetchToDoToods() -> [Tood]{
            var fetchedToods: [Tood] = []
            do {
                let fetchRequest: NSFetchRequest<Tood> = Tood.fetchRequest()
                fetchedToods = try saveTooDs.context.fetch(fetchRequest)
            } catch {}
            return fetchedToods
        }
        
}

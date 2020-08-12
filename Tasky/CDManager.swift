//
//  CDManager.swift
//  Tasky
//
//  Created by Fikri Muhammad Nur on 12/08/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit
import CoreData

struct DataModel{
    var name : String
    var id : NSManagedObjectID
}

class CDManager:NSObject{
    
    var appDel = UIApplication.shared.delegate as! AppDelegate
    var listData : [DataModel] = []
    
    override init() {
        super.init()
        readData()
    }
    
    
    func saveData(name:String){
        let context = appDel.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "TaskList", into: context)
        entity.setValue(name, forKey: "task")
        do{
            try context.save()
        }catch{
            print(error)
        }
        readData()
    }
    
    func readData(){
        let context = appDel.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TaskList")
        
        do{
            let result = try context.fetch(request)
            if result.count < 0{
                listData = []
            }else{
                for item in result as! [NSManagedObject]{
                    if let itemName = item.value(forKey: "task"){
                        listData.append(DataModel(name: itemName as! String, id: item.objectID))
                    }
                    
                }
            }
        }
        catch{
            print(error)
        }
        
    }
    
    func updateData(id:NSManagedObjectID,newName:String){
        let context = appDel.persistentContainer.viewContext
        let entity = context.registeredObject(for: id)
        entity?.setValue(newName, forKey: "task")
        do{
            try context.save()
        }catch{
            print(error)
        }
    }
    
    func deleteData(id:NSManagedObjectID){
        let context = appDel.persistentContainer.viewContext
        if let entity = context.registeredObject(for: id){
            context.delete(entity)
            do{
                try context.save()
            }catch{
                print(error)
            }
        }
    }
}


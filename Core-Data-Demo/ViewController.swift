//
//  ViewController.swift
//  Core-Data-Demo
//
//  Created by Kostyantyn Runduyev on 11/27/16.
//  Copyright © 2016 Kostyantyn Runduyev. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        // Insert begin
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        newUser.setValue("Kostya", forKey: "name")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(35, forKey: "age")
        do {
            try context.save()
        } catch {
        }
        // Insert end
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // Select
        request.predicate = NSPredicate(format: "name = %@", "Rob")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "name") as? String {
                        print(username)
                    }
                    
                    //Update
//                    result.setValue("Mark", forKey: "name")
                    //Delete
//                    context.delete(result)
//                    do {
//                        try context.save()
//                    } catch {
//                    }
                }
                
            } else {
                print("No results")
            }
            
        } catch {
            print("Could not fetch results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


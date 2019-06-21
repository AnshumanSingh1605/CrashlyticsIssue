//
//  DatabaseHandler.swift
//  CrashlyticsIssue
//
//  Created by Anshuman Singh on 6/21/19.
//  Copyright © 2019 Anshuman Singh. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// For Issues Database
class DBHandler {
    
    class func saveToDatabase(_ title : String,_ body : String ,comments url : String) {
        //object for appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //getting the context object for the database.
        let context = appDelegate.persistentContainer.viewContext
        
        //creating the issues entity.
        let entity = NSEntityDescription.entity(forEntityName: "Issues", in: context)
        
        //Gets the config object from the database with the above entity.
        let newIssue = NSManagedObject(entity: entity!, insertInto: context) as? Issues
        if let _newIssue = newIssue {
           
            _newIssue.title = title
            _newIssue.body = body
            _newIssue.comment_url = url
            
            //saving the context, after the new entity is been added.
            appDelegate.saveContext()
        }
    }
    
    //Retrieves all the issues saved in the database
    class func getIssuesData() -> [ViewDataModel]? {
        //object for appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //getting the context object for the database.
        let context = appDelegate.persistentContainer.viewContext
        
        var issuesDataArr : [ViewDataModel]? = nil
        
        //creates a request to fetch the contents of the database.
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Issues")
        request.returnsObjectsAsFaults = false
        do {
            //gets the result from the request.
            let result = try context.fetch(request) as? [Issues]
            if let _result = result {
                issuesDataArr = [ViewDataModel]()
                //iterating through the array of results.
                for data in _result {
                    
                    let tempTitle = data.value(forKey: "title") as? String
                    let tempBody = data.value(forKey: "body") as? String
                    let tempCommentUrl = data.value(forKey: "comment_url") as? String
                    
                    let tempViewDataModel = ViewDataModel.init(title: tempTitle ?? "", description: tempBody ?? "", comment: tempCommentUrl)
                    issuesDataArr?.append(tempViewDataModel)
                }
            }
        } catch {
            print("Failed")
        }
        
        return issuesDataArr
    }
    
    /**
     This method is used to delete all the data present in the database.
     */
    class func deleteAllData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //creates a request to fetch the contents of the database.
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Issues")
        request.returnsObjectsAsFaults = false
        do {
            //gets the result from the request.
            let result = try context.fetch(request) as? [Issues]
            
            //iterating through the array of results.
            if let _result = result {
                for data in _result {
                    //deleting all the data present in the result array.
                    context.delete(data)
                }
            }
            //saves the database context after deleting all the data form it.
            appDelegate.saveContext()
        } catch {
            print("Failed")
        }
    }
}


//
//  DatabaseHelper.swift
//  binus_ios_project
//
//  Created by Abhi Wisesa on 12/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    
    static let instance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveNewsInCoreData(at title:String, description : String, authorEmail : String,authorName : String, index : Int, date : Date?, imgData: Data){
        
        var news = NSEntityDescription.insertNewObject(forEntityName: "News", into: context) as! News
        
        news.thumbnail = imgData
        news.title = title
        news.desc = description
        news.authorEmail = authorEmail
        news.date = date
        news.index = Int16(index)
        news.authorName = authorName
        
        do{
            try context.save()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    func updateNews(at title:String, description : String, index : Int ,imgData: Data){
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        fetchRequest.predicate = NSPredicate(format: "index == \(index)")
        
        do {
            let results = try context.fetch(fetchRequest) as! [NSManagedObject]
            if(results.count != 0){
                results[0].setValue(imgData, forKey: "thumbnail")
                results[0].setValue(title, forKey: "title")
                results[0].setValue(description, forKey: "desc")
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getAllNews() -> [News]{
        var arrFetchNews = [News]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        do{
            arrFetchNews = try context.fetch(fetchRequest) as! [News]
        }catch let error{
            print(error.localizedDescription)
        }
        
        return arrFetchNews
    }
    
}

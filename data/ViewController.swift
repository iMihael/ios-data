//
//  ViewController.swift
//  data
//
//  Created by ItCraft_dev8 on 1/22/15.
//  Copyright (c) 2015 ItCraft_dev8. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var table: UITableView!
    
    var data: [String] = ["Plums", "Apples", "Pears", "Bananas"]
    var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
    var context:NSManagedObjectContext = NSManagedObjectContext()
    
    @IBAction func addAction() {
        var newFruit = NSEntityDescription.insertNewObjectForEntityForName("Fruits", inManagedObjectContext: self.context) as NSManagedObject
        newFruit.setValue(textField.text, forKey: "name")
        newFruit.setValue(NSDate(), forKey: "created_at")
        
        context.save(nil)
        println(newFruit)

        data.append(String(textField.text))
        table.reloadData()
        textField.text = ""
    }
    
    @IBAction func deleteAction() {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.data[indexPath.row]
        return cell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.context = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Fruits")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        if results.count > 0 {
            data = []
            for res in results {
                println(res)
                data.append(String(res.name))
            }
        }
        println(data)
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


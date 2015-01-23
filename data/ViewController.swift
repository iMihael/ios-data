//
//  ViewController.swift
//  data
//
//  Created by ItCraft_dev8 on 1/22/15.
//  Copyright (c) 2015 ItCraft_dev8. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var table: UITableView!
    
    var data: [String] = [String]()
    
    @IBAction func addAction() {

        var f: Fruit = Fruit.newInstance()
        f.name = textField.text
        f.created_at = NSDate()
        Fruit.save()
        
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

        var fruits = Fruit.findAll()
        for f in fruits {
            self.data.append(f.name)
        }
        
        table.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


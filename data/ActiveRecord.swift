//
//  ActiveRecord.swift
//  data
//
//  Created by ItCraft_dev8 on 1/23/15.
//  Copyright (c) 2015 ItCraft_dev8. All rights reserved.
//

import Foundation
import CoreData
import UIKit
@objc(ActiveRecord)
class ActiveRecord : NSManagedObject {
    
    required override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity:entity, insertIntoManagedObjectContext:context)
    }
    
    class func newInstance() -> Self{
        let entity =  NSEntityDescription.entityForName(self.getEntity(), inManagedObjectContext:self.getContext()!)
        return self(entity:entity!, insertIntoManagedObjectContext:self.getContext()!)
    }
    
    class func getContext() -> NSManagedObjectContext? {
        var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        return appDel.managedObjectContext
    }

    class func getEntity() -> String {
        return ""
    }
    
    class func findAll() -> [AnyObject] {
        let request = NSFetchRequest(entityName: self.getEntity())
        request.returnsObjectsAsFaults = false
        return self.getContext()?.executeFetchRequest(request, error: nil) as [AnyObject]!
    }
    
    class func save() {
        self.getContext()?.save(nil)
    }
    
}
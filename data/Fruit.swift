//
//  Fruit.swift
//  data
//
//  Created by ItCraft_dev8 on 1/23/15.
//  Copyright (c) 2015 ItCraft_dev8. All rights reserved.
//

import Foundation
import CoreData
@objc(Fruit)
class Fruit: ActiveRecord {
    @NSManaged var name: String;
    @NSManaged var created_at: NSDate
    
    override class func getEntity() -> String{
        return "Fruit"
    }
}
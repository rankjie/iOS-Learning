//
//  Task.swift
//  TaskIt
//
//  Created by Jeremy on 9/15/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

import Foundation
import CoreData


@objc(Task)
class Task: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var content: String
    @NSManaged var text: String

}

func == (a: Task, b: Task) -> Bool {
    return a.text == b.text
        && a.content == b.content
        && a.date == b.date
        && a.completed == b.completed
}
//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Jeremy on 9/14/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    var detailTaskModel: Task!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var detailNavigationBar: UINavigationItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if detailTaskModel != nil {
            taskTextField.text = detailTaskModel.text
            contentTextField.text = detailTaskModel.content
            dueDatePicker.date = detailTaskModel.date
        } else {
            detailNavigationBar.title = "Add Task"
        }
    }
    
    
    @IBAction func cacelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        if detailTaskModel != nil {
            //  Edit
            detailTaskModel.text = taskTextField.text
            detailTaskModel.date = dueDatePicker.date
            detailTaskModel.content = contentTextField.text
            detailTaskModel.completed = detailTaskModel.completed
            
            appDelegate.saveContext()
        } else {
            // New
            let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            let manageObjectContext = appDelegate.managedObjectContext!
            
            
            println(manageObjectContext)
            let entityDescription = NSEntityDescription.entityForName("Task", inManagedObjectContext: manageObjectContext)!
            
            let task = Task(entity: entityDescription, insertIntoManagedObjectContext: manageObjectContext)
            
            task.text = taskTextField.text
            task.content = contentTextField.text
            task.date = dueDatePicker.date
            task.completed = false
            
            appDelegate.saveContext()
            
            println("saved")
            
            var request = NSFetchRequest(entityName: "Task")
            var error:NSError? = nil
            var results:NSArray = manageObjectContext.executeFetchRequest(request, error: &error)!
            
            println(error)
            
            println(results)
            
            for result in results {
                println(result)
            }
            
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
}
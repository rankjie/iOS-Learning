//
//  ViewController.swift
//  TaskIt
//
//  Created by Jeremy on 9/13/14.
//  Copyright (c) 2014 Jeremy. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var fetchedResultscontroller = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fetchedResultsController = getFetchResultsController()
        var error:NSError? = nil
        fetchedResultscontroller.delegate = self
        fetchedResultscontroller.performFetch(&error)
        
//        println(results)
        
//        println(error)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let detailVC = segue.destinationViewController as TaskDetailViewController
        if segue.identifier == "showTaskDetail" {
            
            let indexPath = self.tableView.indexPathsForSelectedRows()
            let thisTask = fetchedResultscontroller.objectAtIndexPath(indexPath![0] as NSIndexPath) as Task
            detailVC.detailTaskModel = thisTask
        }
        
        if segue.identifier == "addTask" {
            detailVC.detailTaskModel = nil
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if fetchedResultscontroller.sections == nil {
            return 2
        }
        return fetchedResultscontroller.sections!.count
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if fetchedResultscontroller.sections == nil {
            return 0
        }
        return fetchedResultscontroller.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var thisTask = fetchedResultscontroller.objectAtIndexPath(indexPath) as Task
        
        println(thisTask.text)
        
        if Bool(thisTask.completed) {
            var cell = tableView.dequeueReusableCellWithIdentifier("completedTaskCell") as completedTaskCell
            cell.taskLabel.text = thisTask.text
            
            cell.dateLabel.text = Date.toString(date: thisTask.date)
            
            cell.contentLabel.text = thisTask.content
            
            return cell
        } else {
            var cell = tableView.dequeueReusableCellWithIdentifier("unCompleteTaskCell") as unCompleteTaskCell
            cell.taskLabel.text = thisTask.text
            
            cell.dateLabel.text = Date.toString(date: thisTask.date)
            
            cell.contentLabel.text = thisTask.content
            
            return cell
        }
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        } else {
            return "Completed"
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let thisTask = fetchedResultscontroller.objectAtIndexPath(indexPath) as Task
        
        if indexPath.section == 0 {
            thisTask.completed = true
        } else {
            thisTask.completed = false
        }
        
        (UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
    }
    
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    
    
    
    
    // Utility Methods
    
    func getFetchResultsController() -> NSFetchedResultsController {
        var fetchedResultscontroller = NSFetchedResultsController(fetchRequest: TaskFetchRequest(), managedObjectContext: (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!, sectionNameKeyPath: "completed", cacheName: nil)
        return fetchedResultscontroller
    }
    
    
    func TaskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
}


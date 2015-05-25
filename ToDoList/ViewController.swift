//
//  ViewController.swift
//  ToDoList
//
//  Created by Sean Rogers on 5/14/15.
//  Copyright (c) 2015 Sean Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if table != nil {
            table.reloadData()
        }
    }

    // UITableViewData Source
    // How many rows need to be rendered
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
    }
    
    // UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle != UITableViewCellEditingStyle.Delete {
            return
        }
        
        taskManager.deleteTask(index: indexPath.row)
        taskManager.printData()
        table.beginUpdates()
        table.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        table.endUpdates()
    }
    
    // Reorder support
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let tmp = taskManager.tasks[sourceIndexPath.row]
        taskManager.tasks[destinationIndexPath.row] = taskManager.tasks[sourceIndexPath.row]
        taskManager.tasks[sourceIndexPath.row] = tmp
        table.reloadData()
    }
    
    // create cells for the table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default")
        cell.textLabel?.text = taskManager.tasks[indexPath.row].name
        return cell
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        taskManager.printData()
    }
}


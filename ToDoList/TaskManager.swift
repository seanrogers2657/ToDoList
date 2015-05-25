//
//  TaskManager.swift
//  ToDoList
//
//  Created by Sean Rogers on 5/14/15.
//  Copyright (c) 2015 Sean Rogers. All rights reserved.
//

import UIKit

var taskManager: TaskManager = TaskManager()

struct task {
    var name = "Un-named"
}

class TaskManager: NSObject {
   var tasks = [task]()
    
    func addTask(#nameIn: String) {
        tasks.append(task(name: nameIn))
    }
    
    func deleteTask(#nameIn: String) {
        var indexRetrieved: Int = -1
        for var i = 0; i < tasks.count; i++ {
            if tasks[i].name == nameIn {
                indexRetrieved = i
            }
        }
        
        if indexRetrieved >= 0 && indexRetrieved < tasks.count {
            tasks.removeAtIndex(indexRetrieved)
        }
    }
    
    func deleteTask(#index: Int) {
        if index >= 0 && index < tasks.count {
            tasks.removeAtIndex(index)
        }
    }
    
    func printData() {
        println("V-------------------------------")
        var i = 0
        for theTask in tasks {
            println("\(i): \(theTask.name)")
            i++
        }
        println("^-------------------------------")
    }
}

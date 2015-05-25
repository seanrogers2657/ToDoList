//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Sean Rogers on 5/14/15.
//  Copyright (c) 2015 Sean Rogers. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var text: UITextField!
    @IBOutlet var save: UIBarButtonItem!
    @IBOutlet var cancel: UIBarButtonItem!
    
    // UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // IOS touch functions
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveTask() {
        if text.text != "" {
            taskManager.addTask(nameIn: text.text)
            text.text = ""
        }
    }
}

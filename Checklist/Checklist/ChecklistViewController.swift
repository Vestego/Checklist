//
//  ViewController.swift
//  Checklist
//
//  Created by Eoghan on 2018-05-15.
//  Copyright © 2018 Vestego. All rights reserved.
//

import UIKit


//Below you're telling the compiler that the Storyboard is a TableView UI and the name of the table is "ChecklistViewController" (This is called a Controller)
class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello World")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //This is a method - this type of method is part of the UITableView's data source protocol
    //numberOfRowsInSection is the external parameter (if you wanted to call this parameter anywhere else in the app) wheras section is the internal parameter, and only exists inside this function
    //The underscore _ is used when you dont want that parameter to have an external name
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    //This is also a method - this type of method is part of the UITableView's data source protocol
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //This gets a copy of the prototype cell (either a new one or a recycled one) and puts it into a local constant called cell
        //Note that it's a constant because its LET and not VAR
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        //Here we ask the tableViewCell for the view with the tag "1000". This is a handy way to do it rather than do @IBOutlet variable
        let label = cell.viewWithTag(1000) as! UILabel
        
        //This is hardcoding the values for each cell
        if indexPath.row % 5 == 0 {
            label.text = "Walk the Dog"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Dust the house"
        } else if indexPath.row % 5 == 3 {
            label.text = "Cook dinner"
        } else if indexPath.row % 5 == 4 {
            label.text = "Eat leftovers"
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


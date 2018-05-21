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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //This is also a method - this type of method is part of the UITableView's data source protocol
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        return cell
    }
}


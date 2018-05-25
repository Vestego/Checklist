//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Eoghan on 2018-05-25.
//  Copyright © 2018 Vestego. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //Makes the keyboard appear when the screen appears (already in the text box)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //this determines what field the keyboard focus will be on
        textField.becomeFirstResponder()
    }
}

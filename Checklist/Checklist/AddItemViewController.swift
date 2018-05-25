//
//  AddItemViewController.swift
//  Checklist
//
//  Created by Eoghan on 2018-05-25.
//  Copyright © 2018 Vestego. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}

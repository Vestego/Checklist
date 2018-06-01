//
//  ViewController.swift
//  Checklist
//
//  Created by Eoghan on 2018-05-15.
//  Copyright © 2018 Vestego. All rights reserved.
//

import UIKit


//Below you're telling the compiler that the Storyboard is a TableView UI and the name of the table is "ChecklistViewController" (This is called a Controller)
class ChecklistViewController: UITableViewController, itemDetailViewControllerDelegate {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //I dont want a big title, so have it as =false :]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        //Loading checklist.items from your saved filewhen the app starts
        title = checklist.name
        loadChecklists()
    }
    
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        let newRowIndex = checklist.items.count
        checklist.items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
  
    }
    
    var checklist: Checklist!
    
    required init?(coder aDecoder: NSCoder) {
        //checklist.items = [Checklist.items] ()
        //ROW =1
        //let row0item = ChecklistItem()
        //row0item.text = "Walk the dog"
        //row0item.checked = false
        //checklist.items.append(row0item)
        
        super.init(coder: aDecoder)
//        print("Documents folder is \(documentsDirectory())")
//        print("Data file path is \(dataFilePath())")
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = checklist.items[indexPath.row]
        configureText(for: cell, with: item)
        func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
            let label = cell.viewWithTag(1001) as! UILabel
            
            if item.checked {
                label.text = "√"
            } else {
                label.text = ""
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = checklist.items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //1
        checklist.items.remove(at: indexPath.row)
        
        //2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)

    }
    
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //1
        if segue.identifier == "AddItem" {
            //2
            let controller = segue.destination as! ItemDetailViewController
            //3
            controller.delegate = self
            
            } else if segue.identifier == "EditItem" {
            let controller = segue.destination
                as! ItemDetailViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(
                for: sender as! UITableViewCell) {
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        if let index = checklist.items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated:true)

    }
    
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    // this method is now called saveChecklists()
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            // You encode lists instead of "items"
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(),
                                  options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array!")
        }
    }
    
    // this method is now called loadChecklists()
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                // You decode to an object of [Checklist] type to lists
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding item array!")
            }
        }
    }
}

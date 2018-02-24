//
//  ViewController.swift
//  Todoey
//
//  Created by Sebastian Granda Altamirano on 2/22/18.
//  Copyright © 2018 Sebastian Granda Altamirano. All rights reserved.
//

import UIKit

// 0.- Link this .swift file to the table view and change the inheritate class
class TodoListViewController: UITableViewController {
    
    // 1.- Items displayed
    var itemArray = [Item]()
    
    // 6.- Store the data in the phone
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Seb"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Ang"
        itemArray.append(newItem3)
    
        
        // 6. Store the data in the phone
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    //MARK - TableView Datasource Methods
    
    // 2.- Create the rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // 3.- Display the text in the rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Reuse the cell so when you scroll down and the first disappear, it will show up at the bottom
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath) //Identifier: The name you gave to the navig. item in Canvas
        
        // 7. Build a Data Model: Associate properties (such as "Checked") with each item in the array (Swift file)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //4.2. UI: Set the checkmark when you select a cell and diselect it when you click again (+configure the MS) (Ternary Operator)
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        

        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    // 4.- Detect when the user click in a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row]) //print the string in the array
        
        //4.1. UI: Say that if its checked, its true (the opposite of what you set in Item.swift) -> 4.2.
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData() // Refresh the page
        
        tableView.deselectRow(at: indexPath, animated: true) //UI: When you click, it doesn't keep gray
        

    }
    
    //MARK: Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
       // 5.- Add the Add Pop-up to create a new object
        
        var textField = UITextField()
        
        // Create the alert
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        //What will happen once the user clicks the Add Item Button on the UIAlert
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success!")
            
            let newItem = Item()
            newItem.title = textField.text!
            
            //Append the item written to the array
            self.itemArray.append(newItem)
            
            // 6.- Store the data in the phone
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            //Show the new item in the table view
            self.tableView.reloadData()
        }
        
        // Create the text field where the user will write the task
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        // Show the alert
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}





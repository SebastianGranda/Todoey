//
//  ViewController.swift
//  Todoey
//
//  Created by Sebastian Granda Altamirano on 2/22/18.
//  Copyright © 2018 Sebastian Granda Altamirano. All rights reserved.
//

import UIKit

// 0. Link this .swift file to the table view and change the inheritate class
class TodoListViewController: UITableViewController {
    
    // 1. Items displayed
    let itemArray = ["Find love", "Exercise", "Hey"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - TableView Datasource Methods
    
    // 2. Create the rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // 3. Display the text in the rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath) //Identifier: The name you gave to the navig. item in MS
        cell.textLabel?.text = itemArray [indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    // 4. Detect when the user click in a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row]) //print the string in the array
        
        tableView.deselectRow(at: indexPath, animated: true) //UI: When you click, it doesn't keep gray
        
         //UI: Set the checkmark when you select a cell and diselect it when you click again (+configure the MS)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
}





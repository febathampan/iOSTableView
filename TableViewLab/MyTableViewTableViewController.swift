//
//  MyTableViewTableViewController.swift
//  TableViewLab
//
//  Created by user234888 on 10/20/23.
//Feba Thampan Section 5
//Delete - On swipe


import UIKit
struct toDo{
    let text: String
    var complete: Bool
}


class MyTableViewTableViewController: UITableViewController{
    var toDos = [toDo]()

    
    @IBAction func addToDo(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "Add Item", preferredStyle: .alert)
        alert.addTextField { (textField)in
            textField.placeholder = "Write an item"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { (_) in
            guard let toDotext = alert.textFields?.first?.text   else{
                return}
            self.toDos.append(toDo(text: toDotext,complete: false))
            self.tableView.reloadData()
            
        }))
        present(alert,animated:  true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadToDo()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        saveToDo()
        }
    func saveToDo(){
        let defaults = UserDefaults.standard
        defaults.set(toDos, forKey: "SavedStringArray")
    }
    func loadToDo(){
        let defaults = UserDefaults.standard
        _ = defaults.stringArray(forKey: "SavedStringArray") ?? [String]()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath)
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.text
        if toDo.complete {
           cell.accessoryType = .checkmark
            cell.textLabel?.alpha = 0.6
        }
        else {
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0
        }
        
        return cell
    }
      
    // Override to support editing the table view.
    //Deletes on swipe
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source

            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDos[indexPath.row].complete.toggle()
        tableView.reloadData()
    }

    func loadDefaults()
    {
       self.toDos = UserDefaults.standard.array(forKey: "toDos") as? [toDo] ?? []
    }

    func saveDefaults()
    {
       UserDefaults.standard.set(self.toDos, forKey: "toDos")
    }
}

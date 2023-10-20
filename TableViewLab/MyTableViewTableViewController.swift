//
//  MyTableViewTableViewController.swift
//  TableViewLab
//
//  Created by user234888 on 10/20/23.
//

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
        self.tableView.delegate = self
        self.tableView.dataSource = self
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return cars.count
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
    /**override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
         let alert = UIAlertController(title: "Delete Note", message: "Are you sure you want to delete this note?", preferredStyle: .ActionSheet)

         alert.addAction(UIAlertAction(title: "Yes", style: .Destructive, handler: {
             (alert:UIAlertAction!) in
             //****//
              your code to delete item from parse.
             // ***///*
    //And then remove object from tableview
   // self.noteObjects.removeAtIndex(indexPath.row)
           //   self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        // }))
        // alert.addAction(UIAlertAction(title: "No", style: .Cancel, handler: nil))

         //self.presentViewController(alert, animated: true, completion: nil)
   //  }
 //}
//*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source

            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            
                    //   self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        } /*else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        } */
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDos[indexPath.row].complete.toggle()
        tableView.reloadData()
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

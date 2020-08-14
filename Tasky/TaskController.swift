//
//  TaskController.swift
//  Tasky
//
//  Created by Muhammad Syabran on 30/07/20.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit
import CloudKit


class TaskController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let database = CKContainer.default().privateCloudDatabase
    var notes = [CKRecord]()
    
    @IBOutlet weak var buttonCreateTask: UIButton!
    @IBOutlet weak var buttonGetTask: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(queryDatabase),
                                 for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        queryDatabase()
        
//        corner radius untuk button 'create task'
        buttonGetTask.layer.cornerRadius = 10
//         shadow untuk button 'create task'
        buttonGetTask.layer.shadowColor = UIColor.black.cgColor
        buttonGetTask.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonGetTask.layer.shadowOpacity = 0.3
        buttonGetTask.layer.shadowRadius = 4.0
        
//         corner radius untuk button 'get task'
        buttonCreateTask.layer.cornerRadius = 10
//         shadow untuk button 'get task'
        buttonCreateTask.layer.shadowOffset = CGSize(width: 0, height: 0)
        buttonCreateTask.layer.shadowOpacity = 0.3
        buttonCreateTask.layer.shadowRadius = 4.0
    }
    
    @IBAction func createTask() {
        let alert = UIAlertController(title: "Type Something", message: "What would you like to save in a note?", preferredStyle: .alert)
        alert.addTextField{(textField) in
            textField.placeholder = "Task Title"
            
        }
               
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let post = UIAlertAction(title: "Post", style: .default) {(_) in
            guard let text = alert.textFields?.first?.text else {return}
            self.saveToCloud(note: text)
        }
        alert.addAction(cancel)
        alert.addAction(post)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func saveToCloud(note: String) {
        let newNote = CKRecord(recordType: "Note")
        newNote.setValue(note, forKey: "content")
        
        database.save(newNote) {(record, _) in
            guard record != nil else {return}
            print("saved record")
        }
    }
    

    
    
    @objc func queryDatabase(){
        let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
        database.perform(query, inZoneWith: nil) { (records, _) in
            guard let records = records else { return }
            let sortedRecords = records.sorted(by: { $0.creationDate! > $1.creationDate!})
            self.notes = sortedRecords
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
    //@IBAction func getTask(_ sender: Any) {
        
   // }
}

extension TaskController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let note = notes[indexPath.row].value(forKey: "content") as! String
        cell.textLabel?.text = note
        return cell
    }
}

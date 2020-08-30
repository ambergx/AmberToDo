//
//  ViewController.swift
//  Amber DO
//
//  Created by Amber Gu on 2020/8/30.
//  Copyright © 2020 Amber Gu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks = [String]()
    var currentText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "To Do List"
        
        tasks.append("Amber")
        tasks.append("Jun")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(identifier: "new") as! Creation
        vc.title = "New To Do Item"
        vc.save = {
            DispatchQueue.main.async {
                self.saveItem()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func saveItem() -> Void {
        tasks.append(self.currentText!)
        
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! Detail
        vc.title = "To Do Detail"
        vc.task = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
    
        return cell
    }
}


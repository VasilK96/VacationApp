//
//  VacationsTableViewController.swift
//  TestApp
//
//  Created by Vasil Karashev on 8.02.23.
//

import UIKit

class VacationsTableViewController: AddVacationTableViewController {

    public var vacationIndex: Int?
    public var row: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "vacationCell", for: indexPath) as! VacationsTableViewCell
        cell.vacationName.text = model.name
        cell.location.text = model.location

        return cell
    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // 1
        let item = models[indexPath.row]
        self.deleteItem(item: item)
       
        //2
        let indexPaths = [indexPath]
        self.tableView.deleteRows(at: indexPaths, with: .automatic)
        self.tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = VacationDetailsViewController()
        self.show(vc, sender: VacationsTableViewController())
        vacationIndex = indexPath.row
        guard vacationIndex != nil else {return}
    }
    
}

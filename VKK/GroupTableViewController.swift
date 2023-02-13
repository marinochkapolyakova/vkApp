//
//  GroupTableViewController.swift
//  VKK
//
//  Created by marinapolyakova on 11.12.2022.
//

import UIKit
import SDWebImage

class GroupTableViewController: UITableViewController {
    
    let session  = Session.shared
    let service = Service()
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()

        service.getGroups(token: session.token) { groups in
            self.groups = groups
            
            self.tableView.reloadData()}
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGroup", for: indexPath)

        let group = groups[indexPath.row]
        
        cell.textLabel?.text = group.name
        
        if let photo = group.photo{
            cell.imageView?.sd_setImage(with: URL(string: photo))
        }

        return cell
    }
    }

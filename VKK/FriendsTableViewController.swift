//
//  FriendsTableViewController.swift
//  VKK
//
//  Created by marinapolyakova on 11.12.2022.
//

import UIKit
import SDWebImage
import WebKit

class FriendsTableViewController: UITableViewController {
    
    let session = Session.shared
    let service = Service()
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(session.token)
        
        service.getFriends(token: session.token) { friends in
            self.friends = friends
            
            self.tableView.reloadData()
        }}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let friend = friends[indexPath.row]
        
        cell.textLabel?.text = friend.firstName
        cell.detailTextLabel?.text = friend.lastName
        
        if let photo = friend.photo{
            cell.imageView?.sd_setImage(with: URL(string: photo))
        }
        

        return cell
    }
    
    
    
    @IBAction func logOut(_ sender: Any) {
        resetWK()
    }
    
    func resetWK(){
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0)) {
            self.session.token = ""
            
        }
    }
    
}

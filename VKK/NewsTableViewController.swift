//
//  NewsTableViewController.swift
//  VKK
//
//  Created by marinapolyakova on 10.02.2023.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let session  = Session.shared
    let service = Service()
    var news = [NewsItem]()
    var newsGroup = [NewsGroup]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: String(describing: ImageTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ImageTableViewCell.self))
        
        tableView.register(UINib(nibName: String(describing: HeaderTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeaderTableViewCell.self))
        
        tableView.register(UINib(nibName: String(describing: TextTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TextTableViewCell.self))
        
        tableView.register(UINib(nibName: String(describing: FooterTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FooterTableViewCell.self))
        
        service.getNews(token: session.token) { news in
            self.news = news
            self.tableView.reloadData()}
        
        service.getNewsGroup(token: session.token) { newsGroup in
            self.newsGroup = newsGroup
            self.tableView.reloadData()}}
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderTableViewCell.self)) as! HeaderTableViewCell
            
            let newsGroup = newsGroup[indexPath.row]
            cell.nameLabel.text = newsGroup.name
            
            cell.iconImageView.image = UIImage(named: newsGroup.photoNews ?? "")
            
          //  if let photo = newsGroup.photoNews {
          //      cell.iconImageView?.sd_setImage(with: URL(string: photo))
          //  }
            
          
            
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextTableViewCell.self)) as! TextTableViewCell
            
            let news = news[indexPath.section]
            
            cell.postLabel.text? = news.text!
            
            return cell
            
        case 2:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageTableViewCell.self)) as! ImageTableViewCell
            
            let news = news[indexPath.section]
            
            
            if let photo = news.attachments.first?.photo?.sizes.first?.url{
                cell.imageNews?.sd_setImage(with: URL(string: photo))
            }
            
            return cell
            
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FooterTableViewCell.self)) as! FooterTableViewCell
            
            let news = news[indexPath.section]
            
            cell.likesLabel.text = news.likes?.count.formatted()
            cell.viewsLabel.text = news.views?.count.formatted()
            cell.sharesLabel.text = news.reposts?.count.formatted()
            cell.commentsLabel.text = news.comments?.count.formatted()
            
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
    
}


/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

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



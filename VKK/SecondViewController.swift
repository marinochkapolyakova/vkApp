//
//  SecondViewController.swift
//  VKK
//
//  Created by marinapolyakova on 05.12.2022.
//

import UIKit
import WebKit

class SecondViewController: UIViewController {
    
    let session = Session.shared
    
    let appID = "51495102"
    
    var myTabBarController: MyTabBarController?
    
    var vc: FriendsTableViewController?
    
 var groupVC : GroupTableViewController?
    
    var photoVC : PhotoCollectionViewController?
    
    
    
    @IBOutlet weak var webView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        var urlComponent = URLComponents()
        
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        
        urlComponent.queryItems = [
        URLQueryItem(name: "client_id", value: appID),
        URLQueryItem(name: "redirect_uri", value: "http://oauth.vk.com/blank.html"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "scope", value: "wall,friends"),
        URLQueryItem(name: "response_type", value: "token")]
        
        let request = URLRequest(url: urlComponent.url!)
        
        webView.load(request)
    }
}
extension SecondViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void){
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else{
            decisionHandler(.allow)
            return
        }
        
        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String:String]()) { res, param in
                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        if let token = params["access_token"] {
            self.session.token = token
            
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FriendsTableViewController") as? FriendsTableViewController
            
            self.view.insertSubview((self.vc?.view)!, at: 10)
            
            myTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "second") as? MyTabBarController

            self.view.insertSubview((myTabBarController?.view)!, at: 10)

    
         groupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GroupTableViewController") as? GroupTableViewController

           self.view.insertSubview((groupVC?.view)!, at: 2)
           
            photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoCollectionViewController") as? PhotoCollectionViewController
            
            self.view.insertSubview((photoVC?.view)!, at: 3)
            
            
        }
        decisionHandler(.cancel)
    }
}

//
//  MyTabBarController.swift
//  VKK
//
//  Created by marinapolyakova on 05.12.2022.
//
//
import UIKit


class MyTabBarController: UITabBarController {

    let session = Session.shared
    let service = Service()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//service.getFriends(token: session.token)
//        service.getGroups(token: session.token)
//        service.getGroupsSearch(token: session.token)
//        service.getPhoto(token: session.token)
    }
    
}




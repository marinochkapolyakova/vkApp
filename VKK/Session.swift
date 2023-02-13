//
//  Session.swift
//  VKK
//
//  Created by marinapolyakova on 27.11.2022.
//

import Foundation

class Session{
    static let shared = Session()
    
    private init(){}
    
    var userId = 0
    var token = ""
    
}

//
//  Service.swift
//  VKK
//
//  Created by marinapolyakova on 07.12.2022.
//

import Foundation
import Alamofire

class Service{
    
    let baseUrl = "https://api.vk.com/method"
    
    func getFriends(token: String, completion: @escaping ([Friend]) -> ()){
        let url = baseUrl + "/friends.get"
        let parameters : Parameters = [
            "access_token" : token,
            "v" : "5.131",
            "fields" : "bdate,city,photo_100"]
        
        AF.request(url, method: .get, parameters: parameters).response{ result in
            if let data = result.data{
                if let friends = try? JSONDecoder().decode(Response.self, from: data).response.items{
                    completion(friends)
                }}}}
    
    func getGroups(token: String, completion: @escaping ([Group]) -> ()){
        let url = baseUrl + "/groups.get"
        let parameters : Parameters = [
            "access_token" : token,
            "v" : "5.131",
            "extended" : 1,
            "fields" : "description, photo_100"
        ]
        AF.request(url, method: .post, parameters: parameters).response { result in
            if let data = result.data{
                if let groups = try? JSONDecoder().decode(GroupResponse.self, from: data).response.items {
                    
                    completion(groups)
                    print(groups)
                }}}}
    
    func getPhoto(token: String, completion: @escaping ([Item]) -> ()){
        let url = baseUrl + "/photos.get"
        let parameters : Parameters = [
            "access_token" : token,
            "v" : "5.131",
            "extended" : 1,
            "album_id" : "profile",
            "count" : "71"
        ]
        AF.request(url, method: .post, parameters: parameters).response { result in
            if let data = result.data{
                if let sizes = try? JSONDecoder().decode(PhotoResponse.self, from: data).response.items {
                    
                    completion(sizes)
                    print(sizes)
                }
            }
            
        }
    }
            func getNews(token: String, completion: @escaping ([NewsItem]) -> ()){
                    let url = baseUrl + "/newsfeed.get"
                    let parameters : Parameters = [
                        "access_token" : token,
                        "v" : "5.131",
                        "filters" : "post, photo",
                        "source_ids" : "groups",
                        "count" : "30"
                    ]
                    let queue = DispatchQueue.global(qos: .utility)
                    queue.async {
                        AF.request(url, method: .post, parameters: parameters).response { result in
                            if let data = result.data{
                                if let sizes = try? JSONDecoder().decode(News.self, from: data).response.items {
                                    completion(sizes)
                                    print(sizes)
                                }}}} }
            
            
    func getNewsGroup(token: String, completion: @escaping ([NewsGroup]) -> ()){
            let url = baseUrl + "/newsfeed.get"
            let parameters : Parameters = [
                "access_token" : token,
                "v" : "5.131",
                "filters" : "post, photo",
                "source_ids" : "groups",
                "count" : "30"
            ]
            let queue = DispatchQueue.global(qos: .utility)
            queue.async {
                AF.request(url, method: .post, parameters: parameters).response { result in
                    if let data = result.data{
                        if let groups = try? JSONDecoder().decode(News.self, from: data).response.groups {
                            completion(groups)
                           // print(groups.first?.name)
                        }}}
            }
            
            }
    
   
    
    
    
    
    
    
            
            
            
            
            
            /* func getGroupsSearch(token: String){
             //let url = baseUrl + "/groups.search"
             let parameters : Parameters = [
             "access_token" : token,
             "v" : "5.131",
             "q" : "ios"
             ]
             AF.request(url, method: .get, parameters: parameters).responseJSON { responce in
             print(responce)
             }
             } */
        }
    


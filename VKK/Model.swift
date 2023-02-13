import Foundation

struct Response: Decodable{
    var response: Friends
}
struct Friends : Decodable {
    var items : [Friend]
}

struct Friend : Decodable{
    var firstName : String
    var lastName : String
    var photo : String?
    
    enum CodingKeys : String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_100"
    }
}

struct GroupResponse: Decodable{
    var response : Groups
}

struct Groups : Decodable {
    var items : [Group]
}

struct Group : Decodable{
    var name : String
    var photo : String?
    
    enum GroupCodingKeys : String, CodingKey {
        case name
        case photo = "photo_100"
    }
}

struct PhotoResponse : Decodable {
    var response : Photo
}
struct Photo : Decodable {
    var items : [Item]
}

struct Item : Decodable {
    var sizes : [Size]
}

struct Size : Decodable {
    var url : String 
}


struct News: Decodable{
    var response : NewsResponse
}

struct NewsResponse : Decodable{
    var items : [NewsItem]
    var groups : [NewsGroup]
}
struct NewsItem : Decodable{
    let date: Double
    var text : String?
    var comments: CountableItem?
    let likes: CountableItem?
    var views: CountableItem?
    var reposts: CountableItem?
    var attachments: [Attachment]
}

struct NewsGroup : Decodable{
    var name : String?
    var photoNews : String?
    
    enum NewsCodingKeys : String, CodingKey {
        case name
        case photoNews = "photo_50"
    }
} 

struct CountableItem : Decodable{
    var count: Int
}

struct Attachment : Decodable{
    var photo: NewsPhoto?
}

struct NewsPhoto : Decodable{
    var sizes: [NewsSize]
}
struct NewsSize : Decodable{
    var url: String
}

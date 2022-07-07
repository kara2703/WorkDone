//
//  Posts.swift
//  WorkDone
//
//  Created by Anoushka Kabra (ark258)on 5/3/21.
//

import Foundation

struct PostResponse: Codable {
    var success: Bool
    var data: [Post]
}

struct Post: Codable{
//    var id: Int
    var name: String
    var info: String
    var title: String
    var request: Bool
    var phone_number: String
    var time: Int
    var keywords: [Keyword]
}
struct Keyword: Codable{
    var id: Int
    var word: String
}
    
struct User: Codable{
    let user_id: Int
    let name: String
    let phone_number: String
    let bio: String
    }
    
struct UsersResponse: Codable{
    let success: Bool
    let data: [User]

        
    }
struct UserResponse: Codable{
    let success: Bool
    let data: User
    }
    
//Users
//    Number: User id
//    Text: Name
//    Text: Number
//    List: Posts
//    Text: User Bio
//
//    Keywords
//    Text: keyword
//
//    Posts
//    List: Keyword
//    Text: Info
//    Time stamp: time_created
//    Number: ID
//    List: comments
//    Number: likes
//    Boolean: request/offer
//    Text (optional): Bio



//
//  NetworkManager.swift
//  WorkDone
//
//  Created by Anoushka Kabra(ark258) on 5/5/21.
//

import Foundation
import Alamofire

class NetworkManager{
    static let host = "http://appdevworkdone.herokuapp.com/api/"
    
    static func getAllPosts(completion: @escaping ([Post]) -> Void) {
        let endpoint = "\(host)posts/"
        print("HELLLO WORLD")
        AF.request(endpoint, method: .get).validate().responseData { response in
            

            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()

                if let postResponse = try? jsonDecoder.decode(PostResponse.self, from: data){
                    completion(postResponse.data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
            

    }
    static func getSpecificPost(id: Int, completion: @escaping (Post) -> Void ) {
        let endpoint = "\(host)posts/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData { response in
                switch response.result{
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    if let postResponse = try? jsonDecoder.decode(Post.self, from: data){
                        completion(postResponse)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    static let userid = 1
    static func createPost(name: String, time: String, info: String, phone_number: String,request:Bool,title: String, price: String, completion: @escaping ([Post]) -> Void) {//completion: @escaping (Post) -> Void
        let endpoint = "\(host)posts/\(userid)/"
        let parameters: [String: Any] = [
            "name": name,
            "time": time,
            "info": info,
            "title": title,
            "price": price,
            "phone_number": phone_number,
            "request": request,
            "keywords": []]
        print(parameters)
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
                switch response.result{
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    if let postResponse = try? jsonDecoder.decode(PostResponse.self, from: data){
                        completion(postResponse.data)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
    }
    }
    
    
//    static func createPost(name: String, info: String, phone_number: String,request:Bool, keywords: String, title: String, completion: @escaping (Post) -> Void) {
//        let endpoint = "\(host)posts/"
//        let parameters: [String: Any] = [
//            "Name": name,
//            "Title": title,
//            "Info": info,
//            "Phone Number:": phone_number,
//            "Request": request,
//            "keywords": keywords]
//        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
//                switch response.result{
//                case .success(let data):
//                    let jsonDecoder = JSONDecoder()
//                    if let postResponse = try? jsonDecoder.decode(Post.self, from: data){
//                        completion(postResponse)
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//            }
//    }
//    }
    
//    static func updatePost(body: String, poster: String, id: Int, completion: @escaping (Post)-> Void) {
//        let endpoint = "\(host)posts/\(id)/"
//        let parameters: [String: Any] = [
//            "body": body,
//            "poster": poster ]
//        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
//            switch response.result{
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let postResponse = try? jsonDecoder.decode(Post.self, from: data){
//                    completion(postResponse)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//            }
        
        
    
//    static func deletePost(id: Int, title: String, completion: @escaping (Post) -> Void) {
//        let endpoint = "\(host)posts/\(id)/"
//        let parameters : [String: Any] = [
//            "Title": title
//        ]
//        AF.request(endpoint, method: .delete, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
//            debugPrint(response)
//            switch response.result{
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let postResponse = try? jsonDecoder.decode(Post.self, from: data){
//                    completion(postResponse)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }

}

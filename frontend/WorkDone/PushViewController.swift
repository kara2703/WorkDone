//
//  PushViewController.swift
//  WorkDone
//
//  Created by Anoushka Kabra (ark258) on 5/3/21.
// get rid of shown user data as it gives an impression of networking, just replace everything by userdataa

import Foundation
import UIKit

protocol TitleDelegate: class {
    func changeStuff(newPost: Post)
    func updateTable()

}

class PushViewController: UIViewController, TitleDelegate {
    
    func changeStuff(newPost: Post){
        postData.append(newPost)
        self.shownPostData = self.postData
        postTableView.reloadData()
        
    }
    
    func updateTable() {
        refreshData()
        postTableView.reloadData()
    }
//this is where the table of posts will be presented
    let postTableView = UITableView()
    let filterPostButton = UIBarButtonItem()
    let addPostButton = UIBarButtonItem()
    let postReuseIdentifier = "postReuseIdentifier"
    let makepostButton = UIButton()
    let searchBar = UISearchBar()
    
    let refreshControl = UIRefreshControl()
    
    
    let createAlert = UIAlertController(title: "Add new post", message: nil, preferredStyle: .alert)
    let filterAlert = UIAlertController(title: "Filter poster's posts", message: nil, preferredStyle: .alert)
    let updateAlert = UIAlertController(title: "Update your post", message: nil, preferredStyle: .alert)
    
    

    var postData: [Post] = []
    var shownPostData: [Post] = [] // Unlike in lecture, it would be a good idea to leave this here because we filter and so we need to maintain our original data in postData
    
    // MARK: Variables
    var currentIndexPathToUpdate: IndexPath? // We use this for updating and deleting
 

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Posts!"
        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = UIColor.init(red: 99/255, green: 203/255, blue: 217/255, alpha: 1)
        self.refreshData()
        createDummyData()
        setupViews()
        setupConstraints()
    }
        func createDummyData(){
//        let post1 = Post(id: 1, name: "Anoushka", info: "Need help baking powder for christmas!", title: "Baking Help", request: true, phone_number: "516-244-2222", timestamp: "yoyo", keywords: "baking")
//        let post2 = Post(id: 2, name: "Arnav", info: "Need help baking powder for christmas!", title: "Baking Help", request: true, phone_number: "516-244-2222", timestamp: "yoyo", keywords: "baking")
//        let post3 = Post(id: 3, name: "Jessica", info: "Need help baking powder for christmas!", title: "Baking Help", request: true, phone_number: "516-244-2222", timestamp: "yoyo", keywords: "baking")
//        let post4 = Post(id: 4, name: "Mustafa", info: "Need help baking powder for christmas!", title: "Baking Help", request: true, phone_number: "516-244-2222", timestamp: "yoyo", keywords: "baking")
            
       // sortPostData()
        shownPostData = postData
        }
        
//    func sortPostData() {
//        postData.sort { (leftPost, rightPost) -> Bool in
//            return leftPost.id > rightPost.id
//        }}
    
    func setupViews(){
        if #available(iOS 10.0, *) {
            postTableView.refreshControl = refreshControl
        } else {
            postTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.backgroundColor = .white
        postTableView.register(PostsTableViewCell.self, forCellReuseIdentifier: postReuseIdentifier)
        view.addSubview(postTableView)
        
        filterPostButton.title = "Filter"
        filterPostButton.target = self
        filterPostButton.action = #selector(prepareFilteringAction)
       // navigationItem.leftBarButtonItem = filterPostButton
        
        addPostButton.title = "Add"
        addPostButton.target = self
        addPostButton.action = #selector(presentViewControllerButtonPressed)
        navigationItem.rightBarButtonItem = addPostButton
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
      //searchBar.delegate = self
        view.addSubview(searchBar)
        
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])

        NSLayoutConstraint.activate([
        
        ])
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            searchBar.widthAnchor.constraint(equalToConstant: 250)
        ])
        
        
        
//        NSLayoutConstraint.activate([
//            makepostButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            makepostButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            makepostButton.widthAnchor.constraint(equalToConstant: 250)
//        ])
    }
    
    @objc func refreshData() {
        // MARK: Use getAllPosts
        NetworkManager.getAllPosts { postList in
            self.postData = postList
            self.shownPostData = self.postData
            self.postTableView.reloadData()
        }
        self.refreshControl.endRefreshing()
    }

    @objc func prepareFilteringAction() {
        if filterPostButton.title == "Filter" {
            present(filterAlert, animated: true)
        } else {
            filterPostButton.title = "Filter"
           // shownPostData = postData
        }
    }
    
    @objc func presentCreateAlert() {
        present(createAlert, animated: true)
    }
    
    @objc func pushViewControllerButtonPressed() {
        // TODO 3: create VC to push
        let pushViewController = PushViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    @objc func presentViewControllerButtonPressed() {
        let pushViewController = PostAddViewController()
        pushViewController.delegate = self
        //self.present(presentViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(pushViewController, animated: true)



}
}

extension PushViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // updateAlert.textFields?[0].text = postData[indexPath.row].info
        currentIndexPathToUpdate = indexPath
        let currentPost = shownPostData[indexPath.row]
        present(ViewPost(currentPost: currentPost), animated: true)
//        let editviewController = EditViewController(currentSong: currentSong, row: indexPath.row)
//        editviewController.title = currentPost
//        editviewController.delegate = self
    }
    

}

extension PushViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownPostData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postReuseIdentifier, for: indexPath) as! PostsTableViewCell
        let postObject = postData[indexPath.row]
        cell.configure(with: postObject)
        return cell
    }
}

//extension PushViewController: UISearchBarDelegate{
////    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////        if searchText == ""{
////            self.shownPostData = self.postData
////        }else{
////            shownPostData = postData.filter{
////            return $0.keywords.localizedCaseInsensitiveContains(searchText)
////        }}
//        //updateTable()
////        let integerID = Int(currentPost.id)
////        NetworkManager.getSpecificPost(id: integerID){post in
////                self.shownPostData = [post]
////                self.postTableView.reloadData()
//    }
//}



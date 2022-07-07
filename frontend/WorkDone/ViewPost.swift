//
//  ViewPost.swift
//  WorkDone
//
//  Created by Anoushka Kabra (ark258) on 5/5/21.
//

import Foundation
import UIKit

//TASKS TO DO FOR MIDPOINT:
//WATCH LEC 6 AND COMPLETE THE INFO PLIST THINGY
//ASK HELP ON HOW TO UPDATE STUFF in the table in the ViewController FROM THE ADD BUTTON
//COMPLETE VIEWPOST PAGE WITH ALL THE DELEGATED INFORMATION
//CHANGE THE POSITION OF THE SWITCH ON ADDVIEWCONTROLLER FOR ARNAV




class ViewPost: UIViewController{
    
    var currentPost : Post!
    var row: Int!
    var CreatePostHere = UILabel()
    var nameLabel = UILabel()
    var infoLabel = UILabel()
    var infoTextView = UITextView()
    var requestLabel = UILabel()
    var phoneLabel = UILabel()
    var keywordsLabel = UILabel()
    var titleLabel = UILabel()
    var requestinput = UISwitch()
    var commentSection = UITableView()
    weak var delegate: TitleDelegate?

    
    init(currentPost: Post){
        super.init(nibName: nil, bundle: nil)
        self.currentPost = currentPost//setting the current song of the view controller to hte current song you pass in
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
            
}
    func setupViews(){
        nameLabel.text = "Name: \(currentPost.name)"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(nameLabel)
        
//        requestLabel.text = "Is it a request/offer? (If a request, turn the switch on)"
//        requestLabel.translatesAutoresizingMaskIntoConstraints = false
//        requestLabel.font = UIFont.systemFont(ofSize: 12)
//        view!.addSubview(requestLabel)
//
//        titleLabel.text = "Title:"
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.font = UIFont.systemFont(ofSize: 20)
//        view!.addSubview(titleLabel)
//
        phoneLabel.text = "Phone Number: \(currentPost.phone_number)"
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(phoneLabel)
        
        infoTextView.text = "Info: \(currentPost.info)"
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        infoTextView.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(infoTextView)
        
        commentSection.translatesAutoresizingMaskIntoConstraints = false
       // commentSection.font(
        
//
//        infoLabel.text = "What work needs to be done/ What can you offer to do:"
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        infoLabel.font = UIFont.systemFont(ofSize: 12)
//        view!.addSubview(infoLabel)
//
//
        keywordsLabel.text = "Keywords: \(currentPost.keywords)"
        keywordsLabel.translatesAutoresizingMaskIntoConstraints = false
        keywordsLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(keywordsLabel)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            phoneLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)

        ])
        
        NSLayoutConstraint.activate([
            infoTextView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            infoTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            infoTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            infoTextView.heightAnchor.constraint(equalToConstant: 100)
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)

        ])
        
        NSLayoutConstraint.activate([
            keywordsLabel.topAnchor.constraint(equalTo: infoTextView.bottomAnchor, constant: 10),
            keywordsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            keywordsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

        ])
        
        
        
        
        
        
    }
}

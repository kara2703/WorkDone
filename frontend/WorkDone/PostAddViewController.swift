//
//  PostAddViewController.swift
//  WorkDone
//
//  Created by Anoushka Kabra (ark258) on 5/5/21.
//

import UIKit

protocol SavePriceDelegate: class {
    func newPrice(price: String)

}


class PostAddViewController: UIViewController, SavePriceDelegate{
    func newPrice(price: String) {
        selectedPrice = price
        print(price)
        print(selectedPrice)
    }
    
    
    var row : Int!
    var currentPost: Post!
    var CreatePostHere = UILabel()
    var nameLabel = UILabel()
    var nameinput = UITextField()
    var infoLabel = UILabel()
    var infoinput = UITextField()
    var infoTextView = UITextView()
    var requestLabel = UILabel()
    var phoneLabel = UILabel()
    var phoneinput = UITextField()
    var keywordsLabel = UILabel()
    var keywordsinput = UITextField()
    var titleLabel = UILabel()
    var titleinput = UITextField()
    var priceinput = UILabel()
    var requestinput = UISwitch()
    var saveButton = UIButton()
    var addPriceButton = UIButton()
    weak var delegate: TitleDelegate?
    var selectedPrice = "0"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.init(red: 197/255, green: 207/255, blue: 234/255, alpha: 1)
        
        setupViews()
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        
        CreatePostHere.text = "Create Post Here!"
        CreatePostHere.textAlignment = .center
        CreatePostHere.translatesAutoresizingMaskIntoConstraints = false
        CreatePostHere.font = UIFont.systemFont(ofSize: 30)
        view!.addSubview(CreatePostHere)
        
        
        nameLabel.text = "Name:"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(nameLabel)
        
        requestLabel.text = "Is it a request/offer? (If a request, turn the switch on)"
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.font = UIFont.systemFont(ofSize: 12)
        view!.addSubview(requestLabel)
        
        nameinput.placeholder = "Input Name:"
        nameinput.translatesAutoresizingMaskIntoConstraints = false
        nameinput.layer.cornerRadius = 15
        nameinput.backgroundColor = .white
        view!.addSubview(nameinput)
        
        titleLabel.text = "Title:"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(titleLabel)
        
        addPriceButton.setTitle("Price ready to pay", for: .normal)
        addPriceButton.translatesAutoresizingMaskIntoConstraints = false
        addPriceButton.backgroundColor = UIColor.init(red: 62/255, green: 138/255, blue: 248/255 , alpha: 1)
        addPriceButton.layer.cornerRadius = 15
        addPriceButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        addPriceButton.addTarget(self, action: #selector(pricePagePresented), for: .touchUpInside)
        view!.addSubview(addPriceButton)
        
        titleinput.placeholder = "Input Title for your post:"
        titleinput.translatesAutoresizingMaskIntoConstraints = false
        titleinput.layer.cornerRadius = 15
        titleinput.backgroundColor = .white
        view!.addSubview(titleinput)
        
        phoneLabel.text = "Phone Number:"
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(phoneLabel)
        
        phoneinput.placeholder = "Input Phone Number:"
        phoneinput.translatesAutoresizingMaskIntoConstraints = false
        phoneinput.layer.cornerRadius = 15
        phoneinput.backgroundColor = .white
        view!.addSubview(phoneinput)
        
        infoLabel.text = "What work needs to be done/ What can you offer to do:"
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoinput.layer.cornerRadius = 15
        infoinput.backgroundColor = .white
        view!.addSubview(infoLabel)
        
//
        
        infoinput.placeholder = "Input description of the work:"
        infoinput.translatesAutoresizingMaskIntoConstraints = false
//        infoinput.numberOfLines = 0
        view!.addSubview(infoinput)
        
        keywordsLabel.text = "Keywords:"
        keywordsLabel.translatesAutoresizingMaskIntoConstraints = false
        keywordsLabel.font = UIFont.systemFont(ofSize: 20)
        view!.addSubview(keywordsLabel)
        
        keywordsinput.placeholder = "Input keywords:"
        keywordsinput.layer.cornerRadius = 15
        keywordsinput.backgroundColor = .white
        keywordsinput.translatesAutoresizingMaskIntoConstraints = false
        view!.addSubview(keywordsinput)
        
        priceinput.text = "50"

        
        requestinput.translatesAutoresizingMaskIntoConstraints = false
        requestinput.isOn = true
        requestinput.setOn(true, animated: false)
        requestinput.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        self.view!.addSubview(requestinput)
        
        saveButton.setTitle("Save Post", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = UIColor.init(red: 62/255, green: 138/255, blue: 248/255 , alpha: 1)
        saveButton.layer.cornerRadius = 15
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        saveButton.addTarget(self, action: #selector(savePostButtonPressed), for: .touchUpInside)
        view!.addSubview(saveButton)
        
        
        }
    
        
        
    
    func setupConstraints(){

//        }
        
       // constraintslala(input: nameinput, top: 50, width: 100, height: 30)
        NSLayoutConstraint.activate([
            CreatePostHere.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 10),
            CreatePostHere.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            CreatePostHere.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: CreatePostHere.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        
        NSLayoutConstraint.activate([
            nameinput.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            nameinput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameinput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameinput.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: titleinput.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            phoneLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        
        NSLayoutConstraint.activate([
            phoneinput.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            phoneinput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            phoneinput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            phoneinput.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: phoneinput.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        
//
//
        NSLayoutConstraint.activate([
            infoinput.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            infoinput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            infoinput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            infoinput.heightAnchor.constraint(equalToConstant: 100)

        ])
        
//
//        ])
        NSLayoutConstraint.activate([
            keywordsLabel.topAnchor.constraint(equalTo: infoinput.bottomAnchor, constant: 10),
            keywordsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            keywordsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        
//
//
        NSLayoutConstraint.activate([
            keywordsinput.topAnchor.constraint(equalTo: keywordsLabel.bottomAnchor, constant: 10),
            keywordsinput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            keywordsinput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            keywordsinput.heightAnchor.constraint(equalToConstant: 40)

        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: nameinput.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        NSLayoutConstraint.activate([
            titleinput.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 10),
            titleinput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleinput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleinput.heightAnchor.constraint(equalToConstant: 40)

        ])
        
        NSLayoutConstraint.activate([
            requestLabel.topAnchor.constraint(equalTo: keywordsinput.bottomAnchor, constant: 10),
            requestLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            requestLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            phoneLabel.heightAnchor.constraint(equalToConstant: 40)
    //        nameLabel.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant:-200)
            
        ])
        
        NSLayoutConstraint.activate([
            requestinput.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 10),
            requestinput.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            requestinput.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            requestinput.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: requestinput.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
           // saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        NSLayoutConstraint.activate([
            addPriceButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            addPriceButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addPriceButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
           // saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor,constant: 0),
            addPriceButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        
       
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func switchValueDidChange(_ sender: UISwitch!) {
    if (sender.isOn){
        //print("on")
     //   requestinput
    }
    else{
       // print("off")
    }}
    
    @objc func pricePagePresented() {
        let presentViewController = PricePickerViewController()
        presentViewController.priceDelegate = self
        self.present(presentViewController, animated: true, completion: nil)
    }
        
    @objc func savePostButtonPressed(){
//        let id = 1;
        let time = "8000"
        //var timeStampplaceHolder = "8000"
        if let nametext = nameinput.text, let infotext = infoinput.text, let phonetext = phoneinput.text, let titletext = titleinput.text, let pricetext = priceinput.text{
            NetworkManager.createPost(name:nametext, time: time, info: infotext, phone_number: phonetext, request: requestinput.isOn, title: titletext, price: pricetext){data in
                self.delegate?.updateTable()
        }
            self.dismiss(animated: true, completion: nil)
        
    }
    }//




}
  

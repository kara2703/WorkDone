//
//  ViewController.swift
//  WorkDone
//
//  Created by Anoushka Kabra (ark258) on 5/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    let WelcomeText = UILabel()
    let appInfo = UILabel()
    let makePostButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        WelcomeText.text = "Welcome to WorkDone!"
        WelcomeText.font = UIFont.systemFont(ofSize: 30)
        WelcomeText.backgroundColor = .gray
        WelcomeText.textAlignment = .center
        WelcomeText.numberOfLines = 0
        WelcomeText.textColor = UIColor.init(red: 220/255, green: 244/255, blue: 255/255, alpha: 1)
        WelcomeText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(WelcomeText)
        
        appInfo.text = "This application allows you to make posts for random things you would want help with and pay for, like moving furniture or help in studying, at Cornell!"
        appInfo.font = UIFont.systemFont(ofSize: 15)
        appInfo.textColor = .black
        appInfo.numberOfLines = 0
        appInfo.textAlignment = .center
        appInfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(appInfo)
        
        makePostButton.translatesAutoresizingMaskIntoConstraints = false
        makePostButton.setTitle("Make a post!", for: .normal)
        makePostButton.backgroundColor = UIColor.init(red: 99/255, green: 203/255, blue: 217/255, alpha: 1)
        makePostButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(makePostButton)
        
        
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            WelcomeText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            //WelcomeText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            WelcomeText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            WelcomeText.widthAnchor.constraint(equalToConstant: 280)
            
        ])
        
        NSLayoutConstraint.activate([
            appInfo.topAnchor.constraint(equalTo: WelcomeText.bottomAnchor, constant:10),
            //WelcomeText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            appInfo.heightAnchor.constraint(equalToConstant: 100),
            appInfo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            appInfo.widthAnchor.constraint(equalToConstant: 280)

        ])

        NSLayoutConstraint.activate([
            makePostButton.topAnchor.constraint(equalTo:appInfo.bottomAnchor, constant: 50),
            //WelcomeText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            makePostButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            makePostButton.widthAnchor.constraint(equalToConstant: 250)
        ])
        
    }
    @objc func pushViewControllerButtonPressed() {
        // TODO 3: create VC to push
        let pushViewController = PushViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
}



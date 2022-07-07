//
//  PricePickerViewController.swift
//  WorkDone
//
//  Created by Anoushka Kabra on 5/8/21.
//

import UIKit

class PricePickerViewController: UIViewController {
    
    weak var priceDelegate: SavePriceDelegate?
    let picker = UIPickerView()
    var addPriceButton = UIButton()
    //var pickerData: [String] = [String]()
    var pickerData = ["5","10","15","25","20","35","30","40","45","50","55","65","60","70","75","80","85","90","95","100"]
    var saveButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        picker.delegate = self
        picker.dataSource = self
        
        
        setupViews()
        setupConstraints()

    }
    
    func setupViews(){
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        
        saveButton.setTitle("Save Price", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = UIColor.init(red: 62/255, green: 138/255, blue: 248/255 , alpha: 1)
        saveButton.layer.cornerRadius = 15
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        saveButton.addTarget(self, action: #selector(pricePagePresented), for: .touchUpInside)
        view.addSubview(saveButton)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            picker.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            picker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            picker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            picker.heightAnchor.constraint(equalToConstant: 400)
            
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    @objc func pricePagePresented() {
        priceDelegate?.newPrice(price: pickerData[picker.selectedRow(inComponent: 0)])
        self.dismiss(animated: true, completion: nil)
    }
}
    
extension PricePickerViewController: UIPickerViewDelegate{
    //func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        var priceSelected = pickerData[row]
//        print(priceSelected)
                
    }
    

extension PricePickerViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }

  
    
        


    
}

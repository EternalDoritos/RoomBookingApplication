//
//  ViewController.swift
//  UOW Booking
//
//  Created by Elroy C. on 25/10/21.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
   // @IBOutlet weak var button: UIButton!
    @IBOutlet weak var downChevron: UIImageView!
    

    var selectedCategory: String?
    var categoryList = ["Student", "Staff", "System Admin"]

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return categoryList.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return categoryList[row]
        
     }
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         selectedCategory = categoryList[row]
         textField.text = selectedCategory
     }
     
     func createPickerView() {
         let pickerView = UIPickerView()
         pickerView.delegate = self
         textField.inputView = pickerView
     }
     
     func dismissPickerView() {
         let toolBar = UIToolbar()
         toolBar.sizeToFit()
         
         let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
         toolBar.setItems([button], animated: true)
         toolBar.isUserInteractionEnabled = true
         textField.inputAccessoryView = toolBar
     }
     
     @objc func action() {
        view.endEditing(true)
     }
}



//
//  ViewController.swift
//  TextFieldValidation
//
//  Created by LetMeCall Corp on 20/12/18.
//  Copyright © 2018 LetMeCall Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var referalTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var feMaleButton: CustomButton!
    @IBOutlet weak var maleButton: CustomButton!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var reEnterPswdTF: UITextField!
    
   
    @IBAction func ClickMale(_ sender: CustomButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.feMaleButton.isSelected = false
//            self.maleButton.isEnabled = true
//            self.feMaleButton.isEnabled = false
        } else{
//            self.feMaleButton.isEnabled = true
//            self.maleButton.isEnabled = false
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        self.getData()
        // Do any additional setup after loading the view, typically from a nib.
        
        var uurl = "https://jsonplaceholder.typicode.com/users"
        Alamofire.request(uurl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
             print(response)
            
            let result = response.result
            
            print("\(response.result)")
            //            print("\(response.result.value!["address"])")
            
            if (response.result.value as? [NSDictionary]) != nil
            {
                
                print("stsbxcb")
                
            }
    }
    }
    
    
    
    
    
//    func getData()
//    {
//        var uurl = "https://jsonplaceholder.typicode.com/users"
//        Alamofire.request(uurl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
//
//            let result = response.result
//
//            print("\(response.result)")
////            print("\(response.result.value!["address"])")
//
//            if let dict = response.result.value as? [String:Any]
//            {
//
//                print("stsbxcb")
//
//            }
//
////
////                if let entries = JSON["entries"] as? NSArray{
////
////                    for entry in entries {
////
////                        if let entry = entry as? NSDictionary {
////
////                            for (key, value) in entry {
////                                print("\(key) - \(value)")
////                            }
////                        }
////                    }
////                }
////
////            }
////        }
//            print(response)
//
////            if let json = response.result.value as? NSDictionary
////            {
////                print("\(json)")
////                let address  = json["address"]
////
////            }
//        }
//
//
//
//    }
    func showAlert(_ strMessage: String?) {
        let alert = UIAlertController(title: "Alert", message: strMessage, preferredStyle: .alert)
        
        let yesButton = UIAlertAction(title: "Okay", style: .default, handler: { action in
        })
        
        let noButton = UIAlertAction(title: "Cancel", style: .default, handler: { action in
        })
        alert.addAction(yesButton)
        alert.addAction(noButton)
        
        present(alert, animated: true)
    }

   func isValidEmail(_ email: String?) -> Bool {
        
        let stricterFilter = false
        let stricterFilterString = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let laxString = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let emailRegex = stricterFilter ? stricterFilterString : laxString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }

    func isValidPassword(_ checkString: String?) -> Bool {
        
    let stricterFilterString = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", stricterFilterString)
    return passwordTest.evaluate(with: checkString)
        
    }

    
    @IBAction func submitAction(_ sender: Any) {
        
        if self.firstNameTF.text?.count == 0
        
        {
            self.showAlert("cant be empty")
            
        }
        else if !isValidEmail(self.emailTF.text)
        {
            self.showAlert("please enter valid email")
        }
        else if !isValidPassword(self.passwordTF.text)
      {
          self.showAlert("AtLeast 8 Min Chars,1 Special Char,1 Cap Letter,1 Special Char")
        }
        else if self.zipCodeTF.text?.count == 0
        {
            self.showAlert("ZipCode is required")
        }
        else if !((self.zipCodeTF.text?.count)! >= 4 && (self.zipCodeTF.text?.count)! <= 8)
        {
            self.showAlert("Please enter valid ZipCode")
        }
        else {
            print("kjwhdb")
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }

    
    @IBAction func clickOnFeMaleAction(_ sender: CustomButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.maleButton.isSelected = false
//            self.feMaleButton.isEnabled = true
//            self.maleButton.isEnabled = false
        } else{
            
//            self.maleButton.isEnabled = true
//            self.feMaleButton.isEnabled = false
        }
        
    }
    

}

//let daily = response.result.value!["daily"] as! NSDictionary
//let data = daily["data"] as! NSArray
//for obj in data {
//    print (obj["humidity"])
//}

//
////printing the json in console
//print(jsonObj!.value(forKey: "avengers")!)
//
////getting the avengers tag array from json and converting it to NSArray
//if let heroeArray = jsonObj!.value(forKey: "avengers") as? NSArray {
//    //looping through all the elements
//    for heroe in heroeArray{
//
//        //converting the element to a dictionary
//        if let heroeDict = heroe as? NSDictionary {
//
//            //getting the name from the dictionary
//            if let name = heroeDict.value(forKey: "name") {
//
//                //adding the name to the array
//                self.nameArray.append((name as? String)!)
//            }
//
//        }
//}

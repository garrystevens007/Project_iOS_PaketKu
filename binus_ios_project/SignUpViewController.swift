//
//  SignUpViewController.swift
//  binus_ios_project
//
//  Created by Abhi Wisesa on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    var context: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUp(_ sender: Any) {
        let name = tfName.text
        let email = tfEmail.text
        let password = tfPassword.text
        let passwordConfirm = tfConfirmPassword.text
        if(name?.count)! == 0 {
            showAlert(title: "Sign Up Failed", message: "Name invalid")
            return
        }
        if((name?.count)! < 4 || ((name?.count)! > 12)) {
            showAlert(title: "Sign Up Failed", message: "Name length must between 4-12 characters")
            return
        }
        if !validateEmail(email: email!){
            showAlert(title: "Sign Up Failed", message: "Email invalid")
            return
        }
        if(!validatePassword(password: password!)){
            showAlert(title: "Sign Up Failed", message: "Password must between 5 - 15 characters")
            return
        }
        if(password != passwordConfirm){
            showAlert(title: "Sign Up Failed", message: "Incorrect Confirm Password")
            return
        }
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUsers = NSManagedObject(entity: entity!, insertInto: context)
        newUsers.setValue(name, forKey: "name")
        newUsers.setValue(email?.lowercased(), forKey: "email")
        newUsers.setValue(password, forKey: "password")
        
        var getGender = gender.selectedSegmentIndex
        if getGender == 0 {
            newUsers.setValue("Pria", forKey: "gender")
        }else if getGender == 1 {
            newUsers.setValue("Wanita", forKey: "gender")
        }
        
//        handleUser()
        
        do {
            try context.save()
            performSegue(withIdentifier: "signUpToLogin", sender: self)
        } catch {
            print("save failed")
        }
        
    }
    
    
    func validateEmail(email : String) -> Bool{
        if (!email.hasSuffix(".com") && !email.hasSuffix(".co.id")){
            return false
        }
        if (!email.contains("@")){
            return false
        }
        return true
    }
    
    func validatePassword(password : String) -> Bool{
        if password.count < 5 || password.count > 15{
            return false
        }
        else{
          return true
        }
    }
    
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}

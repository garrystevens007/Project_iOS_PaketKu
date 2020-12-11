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
            showAlert(title: "Sign Up Failed", message: "Password must have at least 1 lowercase,1 Uppercase and 1 number")
            return
        }
        if(password != passwordConfirm){
            showAlert(title: "Sign Up Failed", message: "Password invalid")
            return
        }
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUsers = NSManagedObject(entity: entity!, insertInto: context)
        newUsers.setValue(name, forKey: "name")
        newUsers.setValue(email, forKey: "email")
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
    
    
    func handleUser(){
        let savedUsername = UserDefaults.standard.string(forKey: "name")
    }
    
    func validateEmail(email : String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@([A-Za-z][A-Z0-9a-z._%+-]*)+\\.(com|co\\.id)$"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    
        return emailPred.evaluate(with:email)
    }
    
    func validatePassword(password : String) -> Bool{
        let passwordRegEx = "^(?=.*[A-Z])(?=.*\\d)(?=.*[a-z]).{3,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return passwordPred.evaluate(with:password)
    }
    
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}

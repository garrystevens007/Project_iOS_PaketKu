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
        
        if(name?.count ?? 0 < 4 && name?.count ?? 0 > 12 ){
            print("name length must be between 4-12 characters")
            return
        }
        if !validateEmail(email: email ?? ""){
            print("Email invalid")
            return
        }
        if(!validatePassword(password: email ?? "")){
            print("Password must have at least 1 lowercase and 1 Uppercase")
            return
        }
        if(password != passwordConfirm){
            print("Password and Confirm Password doesn't match")
            return
        }
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUsers = NSManagedObject(entity: entity!, insertInto: context)
        newUsers.setValue(name, forKey: "name")
        newUsers.setValue(email, forKey: "email")
        newUsers.setValue(password, forKey: "password")
        
        UserDefaults.standard.set(name, forKey: "name")
        tfName.text = ""
        tfEmail.text = ""
        tfPassword.text = ""
        tfConfirmPassword.text = ""
        handleUser()
        
        do {
            try context.save()
        } catch {
            print("save failed")
        }
        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
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
    
}

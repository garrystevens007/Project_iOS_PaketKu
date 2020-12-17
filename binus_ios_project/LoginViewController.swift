//
//  LoginViewController.swift
//  binus_ios_project
//
//  Created by Garry on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit
import CoreData


class LoginViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    var context: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    @IBAction func btnMasuk(_ sender: Any) {
        
        if (txtEmail.text?.count)! == 0 || (txtPass.text?.count)! == 0{
            showAlert(title: "Login Failed", message: "All fields requierd !")
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for data in results{
                if txtEmail.text == data.value(forKey: "email") as! String{
                    if txtPass.text == data.value(forKey: "password") as! String{
                        UserDefaults.standard.set(data.value(forKey: "name") as! String, forKey: "name")
                        UserDefaults.standard.set(txtEmail.text?.lowercased(), forKey: "email")
                        
                        UserDefaults.standard.set(data.value(forKey: "gender") as! String, forKey: "gender")
                        
                        
                        handleUser()

                        print("Login As" + (currentUser?.email ?? "NIL"))
                        performSegue(withIdentifier: "loginToMain", sender: self)
                    }
                    else{
                        showAlert(title: "Login Gagal", message: "Kata sandi salah")
                        print(data.value(forKey: "password") as! String)
                    }
                }
            }
            showAlert(title: "Login Gagal", message: "Email tidak ditemukan")
        }catch{
            print("fetch failed")
        }
        
        
        
    }
    @IBAction func btnDaftar(_ sender: Any) {
        
    }
    
    
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
}


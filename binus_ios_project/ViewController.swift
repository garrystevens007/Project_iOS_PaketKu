//
//  ViewController.swift
//  binus_ios_project
//
//  Created by Garry on 09/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

var username : String?
var email : String?
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleUser()
        if(username != nil){
            print("login as \(username)")
            performSegue(withIdentifier: "alreadyLogin", sender: self)
        }
        print("tesss \(username)")
        // Do any additional setup after loading the view, typically from a nib.

    }
    

    @IBAction func btnMasuk(_ sender: Any) {
        
    }
    
    @IBAction func btnDaftar(_ sender: Any) {
        
        
    }
}
public func handleUser(){
    let savedUsername = UserDefaults.standard.string(forKey: "name")
    let savedEmail = UserDefaults.standard.string(forKey: "email")
    email = savedEmail
    username = savedUsername
}




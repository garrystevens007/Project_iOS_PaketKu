//
//  ViewController.swift
//  binus_ios_project
//
//  Created by Garry on 09/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

struct dataNews{
    var title : String?
    var description : String?
    var authorEmail : String?
    var index : Int?
    var date : Date?
    var thumbnail : UIImage?
}

struct currUser{
    var name : String?
    var gender: String?
    var email: String?
}

var currentUser: currUser?

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
    @IBAction func unwindToAwal(_ sender: UIStoryboardSegue){}
}
public func handleUser(){
    let currUsername = UserDefaults.standard.string(forKey: "name")
    let currEmail = UserDefaults.standard.string(forKey: "email")
    let currGender = UserDefaults.standard.string(forKey: "gender")
    
    currentUser = currUser(name: currUsername, gender: currGender, email: currEmail)
    
//    currentUser?.name = currUsername
//    currentUser?.email = currEmail
//    currentUser?.gender = currGender
}







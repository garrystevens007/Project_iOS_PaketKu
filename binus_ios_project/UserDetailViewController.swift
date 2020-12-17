//
//  UserDetailViewController.swift
//  binus_ios_project
//
//  Created by Gratianus Martin on 12/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailEmail: UILabel!
    @IBOutlet weak var detailGender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.text = currentUser?.name
        detailEmail.text = currentUser?.email
        detailGender.text = currentUser?.gender
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutBtn(_ sender: Any) {
        showAlert(title: "Konfirmasi", message: "Apakah anda ingin keluar dari akun anda?")
    }
    
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yaAction = UIAlertAction(title: "Ya", style: .default, handler: {action in self.performSegue(withIdentifier: "unwindToAwal", sender: self)})
        
        
        let batalAction = UIAlertAction(title: "Batal", style: .default, handler: nil)
        
        alert.addAction(yaAction)
        alert.addAction(batalAction)
        present(alert,animated: true,completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

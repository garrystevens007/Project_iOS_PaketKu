//
//  DetailViewController.swift
//  binus_ios_project
//
//  Created by Garry on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtAuthor: UILabel!
    
    var currIndex: IndexPath?
    var currTitle: String?
    var currAuthor: String?
    var currDesc: String?
    var currDate: Date?
    var currThumbnail: UIImage?
    var currAuthorEmail: String?
    var currIndexData: Int16?
    func adjustUI(arg : UITextView){
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    
    @IBAction func btnDelete(_ sender: Any) {
        if(currAuthorEmail != currentUser?.email){
            showAlert(title: "Perhatian", message: "Anda tidak bisa menghapus artikel yang tidak anda tulis!")
            return
        }else{
            DatabaseHelper.instance.deleteNews(index: currIndexData!)
            performSegue(withIdentifier: "unwindFromDelete", sender: nil)
        }
        
    }
    @IBAction func btnEdit(_ sender: Any) {
        if(currAuthorEmail != currentUser?.email){
            showAlert(title: "Perhatian", message: "Anda tidak bisa mengedit artikel yang tidak anda tulis!")
            return
        }
        performSegue(withIdentifier: "editFromDetail", sender: nil)
    }
    @IBOutlet weak var txtDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let format = DateFormatter()
        format.dateFormat = "EEEE, d MMM yyyy HH:mm"
        let formattedDate = format.string(from: currDate!)
        
        txtDesc.text = currDesc
        txtTitle.text = currTitle
        txtAuthor.text = currAuthor
        txtDate.text = formattedDate
        imgThumbnail.image = currThumbnail
        adjustUI(arg: txtDesc)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editFromDetail"{
            let dest = segue.destination as! EditViewController
            dest.editTitle = currTitle
            dest.editDesc = currDesc
            dest.editImage = currThumbnail
            dest.passIndex = currIndex
        }
    }
    
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Mengerti", style: .default, handler: nil)
        
        alert.addAction(action)
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

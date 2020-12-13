//
//  EditViewController.swift
//  binus_ios_project
//
//  Created by Garry on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit
import Photos

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var btnSelectImg: UIButton!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfDescription: UITextField!
    var passIndex : IndexPath?
    
    var editTitle: String?
    var editDesc: String?
    var editImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(passIndex)")
        if passIndex != nil{
            tfTitle.text = editTitle
            tfDescription.text = editDesc
            imgThumbnail.image = editImage
        }else{
            passIndex = nil
        }
        
    }
    
    @IBAction func selectImg(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    @IBAction func saveNews(_ sender: Any) {
        
        
        if passIndex == nil{
            if(tfTitle.text == ""){
                showAlert(title: "Perhatian", message: "Anda harus mengisi judul artikel!")
                return
            }else if (tfDescription.text == ""){
                showAlert(title: "Perhatian", message: "Anda harus mengisi isi artikel!")
                return
            }
            
            else if let png = self.imgThumbnail.image?.pngData(){
//                DatabaseHelper.instance.saveNewsInCoreData(at: tfTitle.text!, description: tfDescription.text!, authorEmail: currentUser?.email, authorName: currentUser?.name, index: arr.count, date: nil, imgData: png)
                let defaultPng = UIImage(named: "defaultIMG")?.pngData()
                
                if(png != defaultPng){
                    DatabaseHelper.instance.saveNewsInCoreData(at: tfTitle.text!, description: tfDescription.text!, authorEmail: currentUser!.email!, authorName: currentUser!.name!, index: arr.count, date: Date(), imgData: png)
                    print("Sukses save DB, email: \(currentUser!.email!), title: \(tfTitle.text!), desc: \(tfDescription.text!)")
                    
                    performSegue(withIdentifier: "unwindToHome", sender: self)
                }else{
                    showAlert(title: "Perhatian", message: "Anda harus mengisi gambar artikel!")
                    return
                
            }
            }
        }
        else{
            if(tfTitle.text == ""){
                showAlert(title: "Perhatian", message: "Anda harus mengisi judul artikel!")
                return
            }else if (tfDescription.text == ""){
                showAlert(title: "Perhatian", message: "Anda harus mengisi isi artikel!")
                return
            }
           else if let png = self.imgThumbnail.image?.pngData(){
            DatabaseHelper.instance.updateNews(at: tfTitle.text!, description: tfDescription.text!, index: passIndex!.row, imgData: png)
            
            performSegue(withIdentifier: "unwindToHome", sender: self)
           }else{
            showAlert(title: "Perhatian", message: "Anda harus mengisi gambar artikel!")
            return
           }
        }
        
    }

    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let userPickedImage = info[.editedImage] as? UIImage else { return }
            imgThumbnail.image = userPickedImage
            picker.dismiss(animated: true)
    }
    
    func showAlert(title: String,message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Mengerti", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }

}

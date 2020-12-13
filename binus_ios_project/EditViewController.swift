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
    let defaultPng = UIImage(named: "defaultIMG")?.pngData()
    
    var editIndexData: Int32?
    var editTitle: String?
    var editDesc: String?
    var editImage: UIImage?
    var flag = 0
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

        do{
            let push = try UserDefaults.standard.integer(forKey: "push")
        }catch{
            UserDefaults.standard.set(0, forKey: "push")
        }
        if passIndex == nil{
          
          let defaultPng = UIImage(named: "defaultIMG")?.pngData()
          
          if(tfTitle.text == ""){
                showAlert(title: "Perhatian", message: "Anda harus mengisi judul artikel!")
                return
            }else if (tfDescription.text == ""){
                showAlert(title: "Perhatian", message: "Anda harus mengisi isi artikel!")
                return
            }
            else if let png = self.imgThumbnail.image?.pngData(){
                if(png == defaultPng){
                    showAlert(title: "Perhatian", message: "Anda harus mengisi gambar artikel!")
                    return
                }else{
                    DatabaseHelper.instance.saveNewsInCoreData(at: tfTitle.text!, description: tfDescription.text!, authorEmail: currentUser!.email!, authorName: currentUser!.name!, index: UserDefaults.standard.integer(forKey: "push"), date: Date(), imgData: png)
                    print("Sukses save DB, email: \(currentUser!.email!), title: \(tfTitle.text!), desc: \(tfDescription.text!)")
                    UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "push") + 1, forKey: "push")
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
            DatabaseHelper.instance.updateNews(at: tfTitle.text!, description: tfDescription.text!, index: Int(exactly: NSNumber(value: editIndexData!))!, imgData: png)

           }else{
            showAlert(title: "Perhatian", message: "Anda harus mengisi gambar artikel!")
            return
           }
        }
        performSegue(withIdentifier: "unwindToHome", sender: self)
        
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

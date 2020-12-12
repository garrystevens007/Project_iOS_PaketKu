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
    
    var currTitle: String?
    var currAuthor: String?
    var currDesc: String?
    var currDate: Date?
    var currThumbnail: UIImage?
    
    func adjustUI(arg : UITextView){
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    
    @IBOutlet weak var txtDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtDesc.text = currDesc
        txtTitle.text = currTitle
        txtAuthor.text = currAuthor
        imgThumbnail.image = currThumbnail
        adjustUI(arg: txtDesc)
        // Do any additional setup after loading the view.
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

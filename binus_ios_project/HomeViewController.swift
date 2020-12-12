//
//  HomeViewController.swift
//  binus_ios_project
//
//  Created by Garry on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit
var arr = [News]()
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        arr = DatabaseHelper.instance.getAllNews()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! TableViewCell
        
        cell.titleNews.text = arr[indexPath.row].title
        cell.authorAndDate.text = " \(arr[indexPath.row].authorName) | \(arr[indexPath.row].date)"
        cell.thumbnailNews.image = UIImage(data: arr[indexPath.row].thumbnail!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

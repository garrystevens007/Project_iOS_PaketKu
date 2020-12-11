//
//  HomeViewController.swift
//  binus_ios_project
//
//  Created by Garry on 10/12/20.
//  Copyright © 2020 Garry. All rights reserved.
//

import UIKit

var arrNews = [dataNews]()
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        arrNews.append(dataNews(title: "Tes", description: "YOIII", authorEmail: "abhi@gmail.com", authorName: "abhi", index: 1, date: nil, thumbnail: nil))
        
        // Do any additional setup after loading the view.
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! TableViewCell
        
        cell.titleNews.text = arrNews[indexPath.row].title!
        cell.authorAndDate.text = " \(arrNews[indexPath.row].authorName!) | \(arrNews[indexPath.row].date)"
        cell.thumbnailNews.image = UIImage(named: "elephant")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

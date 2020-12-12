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
    
    
    var selectedTitle: String!
    var selectedDesc: String!
    var selectedEmail: String!
    var selectedAuthor: String!
    var selectedIndexPath: IndexPath?
    var selectedDate: Date!

    @IBOutlet weak var newsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        arrNews.append(dataNews(title: "Tes", description: "YOIII", authorEmail: "abhi@gmail.com", authorName: "abhi", index: 1, date: nil, thumbnail: nil))
        arrNews.append(dataNews(title: "Tes2", description: "Masuk gan", authorEmail: "anjong@anjong.com", authorName: "Wisesa", index: 2, date: nil, thumbnail: nil))
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTitle = arrNews[indexPath.row].title
        selectedDesc = arrNews[indexPath.row].description
        //selectedDate = arrNews[indexPath.row].date
        selectedAuthor = arrNews[indexPath.row].authorName
        performSegue(withIdentifier: "homeToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToDetail"{
            let dest = segue.destination as! DetailViewController
            dest.currTitle = selectedTitle
            dest.currAuthor = selectedAuthor
            dest.currDesc = selectedDesc
            
        }
    }
    

}

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
    
    
    var selectedTitle: String!
    var selectedDesc: String!
    var selectedEmail: String!
    var selectedAuthor: String!
    var selectedIndexPath: IndexPath?
    var selectedDate: Date!
    var selectedThumbnail: UIImage?

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: app)
        
        arr = DatabaseHelper.instance.getAllNews()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func applicationWillEnterForeground(){
        refresh()
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! TableViewCell
        let format = DateFormatter()
        format.dateFormat = "EEEE, d MMM yyyy HH:mm"
        let formattedDate = format.string(from: arr[indexPath.row].date ?? Date())
        
        cell.titleNews.text = arr[indexPath.row].title
        cell.authorAndDate.text = " \(arr[indexPath.row].authorName ?? "NIL") | \(formattedDate)"
        cell.thumbnailNews.image = UIImage(data: arr[indexPath.row].thumbnail!)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func viewWillAppear(_ animated: Bool) {
        arr = DatabaseHelper.instance.getAllNews()
        refresh()
    }
    
    func refresh(){
        self.newsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTitle = arr[indexPath.row].title
        selectedDesc = arr[indexPath.row].desc
        //selectedDate = arrNews[indexPath.row].date
        selectedIndexPath = indexPath
        selectedAuthor = arr[indexPath.row].authorName
        selectedThumbnail = UIImage(data: arr[indexPath.row].thumbnail!)
        performSegue(withIdentifier: "homeToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToDetail"{
            let dest = segue.destination as! DetailViewController
            dest.currTitle = selectedTitle
            dest.currAuthor = selectedAuthor
            dest.currDesc = selectedDesc
            dest.currThumbnail = selectedThumbnail
            dest.currIndex = selectedIndexPath
        }
    }
    
    @IBAction func unwindToHome(_ sender: UIStoryboardSegue){
        //arr = DatabaseHelper.instance.getAllNews()
        refresh()
    }
    

}


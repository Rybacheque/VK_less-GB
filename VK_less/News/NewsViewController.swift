//
//  News.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 25.04.2022.
//

import UIKit

 class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var news = News.allNews
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewControllerCell", for: indexPath) as! NewsViewControllerCell
        let item = news[indexPath.row]
        cell.news = item
        cell.likePressed = { [weak self] isLiked in
            self?.news[indexPath.row].isLiked = isLiked
        }
        return cell
    }
}

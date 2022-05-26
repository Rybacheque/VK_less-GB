//
//  SearchGroupTableViewController.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 04.04.2022.
//

import UIKit



struct SearchGroupedGroup {
    let character: Character
    var groups: [Group]
}
protocol SearchGroupTableViewControllerDelegate {
    func userUnsubscribe(group: Group)
    func userSubscribe(group: Group)
}


class SearchGroupTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var subscribed = Group.allGroups
    var myGroups: [Group] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return subscribed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchGroupTableViewCell
        let group = subscribed[indexPath.row]
        cell?.searchLogoImageView.image = UIImage(named: group.groupAvatar)
        cell?.searchLabel.text = group.groupName
        cell?.infoLabelSearch.text = group.groupInfo
        return cell ?? UITableViewCell()
    }
    
    //MARK: - Свайп на Подписку/Отписку
    
    var delegate: SearchGroupTableViewControllerDelegate?
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let group = subscribed[indexPath.row]
        let isSubscribe = myGroups.contains{ myGroups in
            return myGroups.groupId == group.groupId
        }
        
        let action: UIContextualAction
        if isSubscribe {
            
            action = UIContextualAction(style: .normal, title: "Отписаться", handler: { [weak self] _, _, complete in
                guard let self = self else {return}
                
                self.myGroups.removeAll(where: { $0.groupId == group.groupId})
                self.delegate?.userUnsubscribe(group: group)
                complete(true)
                
            })
            action.backgroundColor = .systemRed
        } else {
            action = UIContextualAction(style: .normal, title: "Подписаться", handler: { [weak self] _, _, complete in
                guard let self = self else {return}
                
                self.myGroups.append(group)
                self.delegate?.userSubscribe(group: group)
                complete(true)
                
            })
            action.backgroundColor = .systemGreen
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

//MARK: - Поиск

extension SearchGroupTableViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text.isEmpty == false {
            let newItems = subscribed.filter {
                $0.groupName.uppercased().contains(text.uppercased())
            }
            self.subscribed = newItems
            self.tableView.reloadData()
        } else {
            self.myGroups = subscribed
            tableView.reloadData()
        }
        searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.myGroups = subscribed
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.myGroups = subscribed
            tableView.reloadData()
        }
    }
}

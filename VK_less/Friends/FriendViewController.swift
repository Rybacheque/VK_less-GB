//
//  FriendViewController.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 31.03.2022.
//

import UIKit

struct GroupedFriend {
    let character: Character
    var groups: [Friend]
}
class FriendViewController: UITableViewController {
    
    var allFriends = Friend.allFriends
    
    var groupedFriends: [GroupedFriend] {
        var result = [GroupedFriend]()
        
        for friend in allFriends {
            guard let character  = friend.friendSurname.first else {
                continue
            }
            if let groupedIndex = result.firstIndex(where: { $0.character == character }) {
                result[groupedIndex].groups.append(friend)
            } else {
                let groupedFriends = GroupedFriend(character: character, groups: [friend])
                result.append(groupedFriends)
            }
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedFriends.count
    }
    // MARK: Строки на друзей
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupedFriend = groupedFriends[section]
        return groupedFriend.groups.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupedFriend = groupedFriends[section]
        return String(groupedFriend.character)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FriendTableViewCell
        let groupedFriend = groupedFriends[indexPath.section]
        let friend = groupedFriend.groups[indexPath.row]
        cell?.avatarImageView.image = UIImage(named: friend.friendAvatar)
        cell?.label.text = "\(friend.friendName) \(friend.friendSurname)"
        cell?.infoLabel.text = friend.friendInfo
        return cell ?? UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendTableViewCell,
              let index = tableView.indexPath(for: cell),
              groupedFriends.count > index.section,
              groupedFriends[index.section].groups.count > index.row,
              let photosVC = segue.destination as? PhotosViewController else {
                  return
              }
        
        
        let friend = groupedFriends[index.section].groups[index.row]
        photosVC.friendPhotos = friend.friendPhotos
    }
    
    //MARK:  Свайп на удаление
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Удалить", handler: { [weak self] _, _,block in
            
            guard let self = self else { return }
            var needUpdate = false
            
            if self.groupedFriends[indexPath.section].groups.count <= 1 {
                needUpdate = true
            }
            self.allFriends.remove(at: indexPath.row)
            
            tableView.performBatchUpdates({
                tableView.deleteRows(at: [indexPath], with: .fade)
                if needUpdate {
                    tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
                }
            }, completion: nil)
            block(true)
            
        })
        
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

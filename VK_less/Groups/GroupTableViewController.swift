//
//  GroupTableViewController.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 04.04.2022.
//

import UIKit

struct GroupedGroup {
    let character: Character
    var groups: [Group]
}

class GroupTableViewController: UITableViewController {
    var myGroups: [Group] = []
    
    var groupedGroups: [GroupedGroup] {
        var result = [GroupedGroup]()
        
        for group in myGroups {
            guard let character  = group.groupName.first else {
                continue
            }
            if let groupedIndex = result.firstIndex(where: { $0.character == character }) {
                result[groupedIndex].groups.append(group)
            } else {
                let groupedGroup = GroupedGroup(character: character, groups: [group])
                result.append(groupedGroup)
            }
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstGroup = Group.allGroups.first {
            myGroups.append(firstGroup)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            let indicator = LoadingIndicator()
            indicator.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(indicator)
            
            indicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
            indicator.heightAnchor.constraint(equalToConstant: 30).isActive = true
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
            indicator.startAnimation()
        })
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedGroups.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupedGroup = groupedGroups[section]
        return groupedGroup.groups.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupedGroup = groupedGroups[section]
        return String(groupedGroup.character)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupTableViewCell
        let groupedGroup = groupedGroups[indexPath.section]
        let group = groupedGroup.groups[indexPath.row]
        cell?.logoImageView.image = UIImage(named: group.groupAvatar)
        cell?.label.text = group.groupName
        cell?.infoLabel.text = group.groupInfo
        return cell ?? UITableViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let allGroupVC = segue.destination as? SearchGroupTableViewController {
            allGroupVC.myGroups = myGroups
            allGroupVC.delegate = self
        }
    }
}
extension GroupTableViewController : SearchGroupTableViewControllerDelegate {
    func userSubscribe(group: Group) {
        myGroups.append(group)
        tableView.reloadData()
    }
    func userUnsubscribe(group: Group) {
        myGroups.removeAll(where: {$0.groupId == group.groupId})
        tableView.reloadData()
    }
}

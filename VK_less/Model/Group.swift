//
//  Group.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 03.04.2022.
//

import UIKit


struct Group {
    
    let groupId: String
    let groupName: String
    let groupAvatar: String
    let groupInfo: String
    
    static let allGroups: [Group] = [
        Group(groupId: "1", groupName: "Фредди Меркьюри", groupAvatar: "searchgroup", groupInfo: "Самое интересное о легенде"),
        Group(groupId: "2", groupName: "Винил: купить/продать", groupAvatar: "searchgroup2", groupInfo: "Обьявления, барахолка города"),
        Group(groupId: "3", groupName: "Queen все альбомы", groupAvatar: "group1", groupInfo: "Полная дискография"),
        Group(groupId: "4", groupName: "Фанаты группы Queen", groupAvatar: "group2", groupInfo: "Вся информация и рок-группе"),
        Group(groupId: "5", groupName: "История Queen", groupAvatar: "group3", groupInfo: "Редкие и интересные факты"),
        Group(groupId: "6", groupName: "Beatles все альбомы", groupAvatar: "BeatlesCover", groupInfo: "Слушай все альбомы тут"),
        Group(groupId: "7", groupName: "Beatles главные хиты", groupAvatar: "BeatlesCover3", groupInfo: "Хиты без времени и срока годности"),
        Group(groupId: "8", groupName: "Beatles история группы", groupAvatar: "BeatlesCover2", groupInfo: "История группы с начала и до конца")]
    
}

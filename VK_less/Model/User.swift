//
//  User.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 03.04.2022.
//

import UIKit



struct Friend {
    
    let friendId: String
    let friendName: String
    let friendSurname: String
    let friendInfo: String
    let friendAvatar: String
    let friendPhotos: [String]
    
    static var allFriends: [Friend] = [Friend(friendId: "1",
                                              friendName: "Фредди",
                                              friendSurname: "Меркьюри",
                                              friendInfo: "Вокалист рок-группы Queen",
                                              friendAvatar: "Fredy",
                                              friendPhotos: ["Fredy1","Fredy2","Fredy3","Fredy4","Fredy5","Fredy6"]),
                                       Friend(friendId: "2", friendName: "Джон",
                                              friendSurname: "Дикон",
                                              friendInfo: "Бас-гитарист Queen",
                                              friendAvatar: "John",
                                              friendPhotos: ["John1","John2","John3"]),
                                       Friend(friendId: "3", friendName: "Брайан",
                                              friendSurname: "Мэй",
                                              friendInfo: "Гитарист Queen",
                                              friendAvatar: "Brian",
                                              friendPhotos: ["Brian1","Brian2","Brian3"]),
                                       Friend(friendId: "4", friendName: "Роджер",
                                              friendSurname: "Тейлор",
                                              friendInfo: "Барабанщик Queen",
                                              friendAvatar: "Roger",
                                              friendPhotos: ["Roger1","Roger2","Roger3"]),
                                       Friend(friendId: "5", friendName: "Джон",
                                              friendSurname: "Леннон",
                                              friendInfo: "Один из основателей The Beatles",
                                              friendAvatar: "Lennon",
                                              friendPhotos: ["Lennon1","Lennon2","Lennon3"]),
                                       Friend(friendId: "6", friendName: "Пол",
                                              friendSurname: "Маккартни",
                                              friendInfo: "Один из основателей The Beatles",
                                              friendAvatar: "McCartney",
                                              friendPhotos: ["McCartney1","McCartney2","McCartney3"]),
                                       Friend(friendId: "7", friendName: "Джордж",
                                              friendSurname: "Харрисон",
                                              friendInfo: "Соло-гитарист The Beatles",
                                              friendAvatar: "Harrison",
                                              friendPhotos: ["Harrison1","Harrison2","Harrison3"]),
                                       Friend(friendId: "8", friendName: "Ринго",
                                              friendSurname: "Старр",
                                              friendInfo: "Барабанщик группы The Beatles",
                                              friendAvatar: "Starr",
                                              friendPhotos: ["Starr1","Starr2","Starr3"])].sorted(by: {$0.friendSurname < $1.friendSurname})
}

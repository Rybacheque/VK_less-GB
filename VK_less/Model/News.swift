//
//  News.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 25.04.2022.
//

import UIKit
struct News {
    let logoNews: String
    let groupLogoNews: String
    let descriptionNews: String
    let imageName: String
    let countViews: Int
    var isLiked: Bool
}
extension News {
    static let allNews = [News(logoNews: "Фанаты группы Queen", groupLogoNews: "group2", descriptionNews: "Приглашаем на концерт!", imageName: "Fredy3", countViews: 34, isLiked: true),
                          News(logoNews: "История Queen", groupLogoNews: "group3", descriptionNews: "Новые подробности смерти:", imageName: "Fredy6", countViews: 90, isLiked: false),
                          News(logoNews: "Фредди Меркьюри", groupLogoNews: "searchgroup", descriptionNews: "Вышел новый альбом! Послушайте обязательно!", imageName: "Fredy1", countViews: 67, isLiked: true),
                          News(logoNews: "Queen все альбомы", groupLogoNews: "group1", descriptionNews: "Премьера фильма", imageName: "group1", countViews: 48, isLiked: false),
                          News(logoNews: "Beatles главные хиты", groupLogoNews: "BeatlesCover3", descriptionNews: "Зачем нам музыка?", imageName: "BeatlesCover", countViews: 53, isLiked: true),
                          News(logoNews: "Beatles история группы", groupLogoNews: "BeatlesCover2", descriptionNews: "История жизни группы, новые факты", imageName: "BeatlesCover2", countViews: 70, isLiked: false),
                          News(logoNews: "Винил: купить/продать", groupLogoNews: "searchgroup2", descriptionNews: "Новые альбомы апреля:", imageName: "searchgroup2", countViews: 61, isLiked: true),
                          News(logoNews: "Beatles главные хиты", groupLogoNews: "BeatlesCover", descriptionNews: "Рок/Рэп - что популярнее?", imageName: "BeatlesCover3", countViews: 12, isLiked: false)]
}


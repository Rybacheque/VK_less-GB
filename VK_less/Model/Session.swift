//
//  Session.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 25.05.2022.
//

import Foundation

class Session {
    private init() {}
    static let instance = Session()
    
    var token: String = "" // хранение токена в VK
    var userId: Int = 0 // хранение идентификатора пользователя VK
    
}

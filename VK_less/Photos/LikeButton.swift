//
//  LikeButton.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 07.04.2022.
//

import UIKit

class LikeButton: UIControl {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var counterLabel: UILabel?
    
    var likesCounter: Int = 0
    
    override var isSelected: Bool{
        didSet {
            
            guard oldValue != isSelected else { return }
            imageView?.image = isSelected ? UIImage(named:"likeEnable") : UIImage(named: "likeDisable")
            if isSelected {
                likesCounter += 1
            } else {
                likesCounter -= 1
            }
            counterLabel?.text = "\(likesCounter)"
            
            UIView.transition(with: self, duration: 0.3, options: [.transitionFlipFromTop], animations: {
            }, completion: nil)
        }
        
    }
}




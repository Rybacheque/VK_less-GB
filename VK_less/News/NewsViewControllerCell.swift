//
//  NewsViewControllerCell.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 25.04.2022.
//

import UIKit
class NewsViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var logoNews: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var groupLogoNews: UIImageView!
    @IBOutlet weak var NewsView: UIView!
    
    
    var likePressed: ((Bool) -> ())?
    
    var news: News? {
        didSet {
            if let news = self.news{
                update(news: news)
            }
        }
    }
    
    class NewsView: UIView {
        
        
        @IBInspectable var shadowOpacity: Float = 0 {
            didSet {
                layer.shadowOpacity = shadowOpacity
            }
        }
        
        @IBInspectable var shadowRadius: CGFloat = 0 {
            didSet {
                layer.shadowRadius = shadowRadius
            }
        }
        
        @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
            didSet {
                layer.shadowOffset = shadowOffset
            }
        }
        
        @IBInspectable var shadowColor: UIColor? = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0) {
            didSet {
                layer.shadowColor = shadowColor?.cgColor
            }
        }
        
    }

    
    func update(news: News) {
        descriptionLabel.text = news.descriptionNews
        logoNews.text = news.logoNews
        groupLogoNews.image = UIImage(named: news.groupLogoNews)
        photoView.image = UIImage(named: news.imageName)
        if news.isLiked {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for:  .normal)
        }
        countLabel.text = "\(news.countViews)"
        
        
    }
    @IBAction func likeButtonPress(_ sender: Any) {
        if  news != nil {if news != nil {
            news!.isLiked = !news!.isLiked
            likePressed?(news!.isLiked)
        }
        }
    }
}

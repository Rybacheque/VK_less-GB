//
//  PreviewVC.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 02.05.2022.
//

import UIKit

class PreviewVC: UIViewController {
    
    @IBOutlet weak var imageViewPreview: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    var swipeGestureLeft: UISwipeGestureRecognizer!
    var swipeGestureRight: UISwipeGestureRecognizer!
    var currentPhoto: String!
    var currentIndex = 0
    var photos: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeGestureLeft.direction = .left
        swipeGestureRight.direction = .right
        self.view.addGestureRecognizer(swipeGestureLeft)
        self.view.addGestureRecognizer(swipeGestureRight)
        
        
        imageViewPreview.image = UIImage(named: self.currentPhoto)
        
        
        if let idx = photos.enumerated().first(where: {
            $0.element == self.currentPhoto
        }) {
            self.currentIndex = idx.offset
            
            if (idx.offset + 1) < self.photos.count {
                self.secondImageView.image = UIImage(named: photos[idx.offset + 1])
            }
        }
    }
    @objc func didSwipeLeft() {
        
        let idx = currentIndex + 1
        guard photos.count > idx else { return }
        self.currentIndex = idx
        secondImageView.image = UIImage(named: self.photos[idx])
        
        
        secondImageView.transform = .init(translationX: imageViewPreview.bounds.width, y: 0)
        secondImageView.isHidden = false
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.imageViewPreview.transform = .init(scaleX: 0.8, y: 0.8)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                self.secondImageView.transform = .identity
                self.imageViewPreview.transform = .init(translationX: -self.imageViewPreview.bounds.width, y: 0)
            })
            
        }, completion: { _ in
            self.secondImageView.isHidden = true
            self.imageViewPreview.image = UIImage(named: self.photos[idx])
            self.imageViewPreview.transform = .identity
            
        })
    }
    @objc func didSwipeRight() {
        
        let idx = currentIndex - 1
        guard photos.count > idx && idx >= 0 else { return }
        self.currentIndex = idx
        secondImageView.image = UIImage(named: self.photos[idx])
        
        
        secondImageView.transform = .init(translationX: -self.imageViewPreview.bounds.width, y: 0)
        secondImageView.isHidden = false
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.imageViewPreview.transform = .init(scaleX: 0.8, y: 0.8)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3, animations: {
                self.secondImageView.transform = .identity
                self.imageViewPreview.transform = .init(translationX: self.imageViewPreview.bounds.width, y: 0)
            })
            
        }, completion: { _ in
            self.secondImageView.isHidden = true
            self.imageViewPreview.image = UIImage(named: self.photos[idx])
            self.imageViewPreview.transform = .identity
        })
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
    }
}



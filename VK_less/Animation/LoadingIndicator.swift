//
//  LoadingView.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 28.04.2022.
//

import UIKit

class LoadingIndicator : UIView {
    
    let firstView = UIView()
    let secondView = UIView()
    let thirdView = UIView()
    
    var isAnimating = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        [firstView, secondView, thirdView].forEach {
            $0.layer.cornerRadius = $0.frame.width / 2
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        
        let views = [firstView, secondView, thirdView]
        
        views.forEach {
            $0.backgroundColor = .clear
            $0.alpha = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        views.forEach {
            $0.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 30).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
        
        firstView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 5).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: 5).isActive = true
        thirdView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        firstView.widthAnchor.constraint(equalTo: secondView.widthAnchor).isActive = true
        secondView.widthAnchor.constraint(equalTo: thirdView.widthAnchor).isActive = true
        
        views.forEach {
            $0.layer.cornerRadius = $0.frame.width
        }
    }
    
    convenience init () {
        self.init(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func startAnimation() {
        
        self.isAnimating = true
        animate()
    }
    
    func stopAnimation() {
        self.isAnimating = false
    }
    
    private func animate() {
        let duration: Double = 1
        UIView.animate(withDuration: duration / 2, delay: 0, options: [.autoreverse], animations: {
            self.firstView.alpha = 1
        }, completion: { _ in
            self.firstView.alpha = 0
        })
        
        UIView.animate(withDuration: duration / 2, delay: duration / 3, options: [.autoreverse], animations: {
            self.secondView.alpha = 1
        }, completion: { _ in
            self.secondView.alpha = 0
        })
        
        UIView.animate(withDuration: duration / 2, delay: (duration / 3) * 2, options: [.autoreverse], animations: {
            self.thirdView.alpha = 1
        }, completion: { _ in
            self.thirdView.alpha = 0
            if self.isAnimating {
                self.animate()
            }
        })
        
    }
    
}

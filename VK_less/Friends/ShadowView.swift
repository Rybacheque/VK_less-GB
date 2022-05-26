//
//  ShadowView.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 07.04.2022.
//

import UIKit

class ShadowView: UIView {
    
    
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



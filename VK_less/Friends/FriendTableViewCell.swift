//
//  FriendTableViewCell.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 31.03.2022.
//

import UIKit
class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var avatarImageView: CircularImageView!
    @IBOutlet weak var avatarContainerView: ShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarContainerView.circular()
        
    }
    
    @IBAction func photoPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.autoreverse], animations: {
            self.avatarImageView.transform = .init(scaleX: 1.1, y: 1.1)
        }, completion: { _ in
            self.avatarImageView.transform = .identity
        })
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
//MARK:  Закругление ImageView
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
}
//MARK:  Закругление View и тени
extension UIView {
    func circular(
        borderwight: CGFloat = 2.0)
    {
        self.layer.cornerRadius = (self.frame.size.height / 2.0)
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
}



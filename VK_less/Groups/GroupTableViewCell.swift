//
//  GroupTableViewCell.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 04.04.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ContainerGroupView.circularGroup()
    }
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ContainerGroupView: ShadowView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // MARK: Закругление ImageView
        class CircularImageView: UIImageView {
            override func layoutSubviews() {
                super.layoutSubviews()
                self.layer.cornerRadius = self.frame.size.height / 2
                self.clipsToBounds = true
            }
        }
        
    }
}

// MARK: Закругление View и тени
extension UIView {
    func circularGroup(
        borders: CGFloat = 2.0){
            self.layer.cornerRadius = (self.frame.size.height / 2.0)
            self.clipsToBounds = true
            self.layer.masksToBounds = false
        }
}

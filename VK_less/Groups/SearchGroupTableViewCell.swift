//
//  SearchGroupTableViewCell.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 04.04.2022.
//

import UIKit

class SearchGroupTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ContainerSearchGroupView.circularSearchGroup()
        
    }
    
    
    @IBOutlet weak var searchLogoImageView: UIImageView!
    @IBOutlet weak var ContainerSearchGroupView: ShadowView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var infoLabelSearch: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //MARK: - Закругление ImageView
        class CircularImageView: UIImageView {
            override func layoutSubviews() {
                super.layoutSubviews()
                self.layer.cornerRadius = self.frame.size.height / 2
                self.clipsToBounds = true
            }
        }
    }
}
//MARK: - Закругление View и тени
extension UIView {
    func circularSearchGroup(
        searchBorders: CGFloat = 2.0)
    {
        self.layer.cornerRadius = (self.frame.size.height / 2.0)
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
}

//
//  PhotosCollectionViewCell.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 31.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeControl: LikeButton!
    var imageName: String? {
        didSet {
            if let imageName = imageName {
                imageView?.image = UIImage(named: imageName)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeControl.addTarget(self, action: #selector(likeControlTapped), for: .touchUpInside)
    }
    @objc
    func likeControlTapped(){
        likeControl.isSelected = !likeControl.isSelected
    }
}


//MARK:  Размер картинок
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
        let screenWidth = UIScreen.main.bounds.width
        let itemSize = (screenWidth / 3) - 10
        return CGSize(width: itemSize, height: itemSize)
    }
}


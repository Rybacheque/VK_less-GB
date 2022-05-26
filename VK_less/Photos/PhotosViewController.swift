//
//  PhotosViewController.swift
//  VK_less
//
//  Created by Сергей Рыбачек on 31.03.2022.
//

import UIKit
private let reuseIdentifier = "Cell"

class PhotosViewController: UICollectionViewController {
    
    
    var friendPhotos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: Колличество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendPhotos.count
    }
    //MARK: Привязка imageView
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell
        let friendPhoto = friendPhotos[indexPath.item]
        cell?.imageName = friendPhoto
        
        return cell ?? UICollectionViewCell ()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goPhoto"
        {
            // Даём понять, что sender это ячейка класса MyCell
            let cell: PhotosCollectionViewCell  = sender as! PhotosCollectionViewCell
            
            // Получает объект image из текущей ячейки
            let image = cell.imageName
            
            // Даём понять, что destinationViewController это контроллер класса PreviewVC
            let previewVC: PreviewVC = segue.destination as! PreviewVC
            
            // Задаём контроллеру изображение с текущей ячейки
            previewVC.currentPhoto = image
            previewVC.photos = friendPhotos
        }
    }
    
    
    // MARK: Анимации
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.alpha = 0
        cell.transform = .init(scaleX: 0, y: 0)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                cell.alpha = 1
                cell.transform = .identity
            })
        }
    }
}


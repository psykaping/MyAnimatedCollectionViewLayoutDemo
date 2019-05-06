//
//  PhotoCollectionViewController.swift
//  MyAnimatedCollectionViewLayoutDemo
//
//  Created by 王克平 on 2019/5/6.
//  Copyright © 2019 王克平. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    let photos: [String] = ["icon_vert", "icon_artisan", "icon_blanc", "icon_chrom", "icon_firin", "icon_histoire", "icon_if", "icon_kukei", "icon_mai", "icon_neptune", "icon_noire", "icon_surara"]
    let width: CGFloat = (UIScreen.main.bounds.width) / 3.2

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout?.itemSize = CGSize(width: width, height: width)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: width, height: width)
        image.image = UIImage(named: photos[indexPath.row])
        cell.contentView.addSubview(image)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photo" {
        let indexPath = self.collectionView.indexPath(for: sender as! UICollectionViewCell)
        let photo = photos[indexPath!.row]
        let photoViewController = segue.destination as? PhotoViewController
            photoViewController!.photo = photo
        }
    }

}

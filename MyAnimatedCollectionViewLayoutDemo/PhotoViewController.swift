//
//  PhotoViewController.swift
//  MyAnimatedCollectionViewLayoutDemo
//
//  Created by 王克平 on 2019/5/6.
//  Copyright © 2019 王克平. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    var photo: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let width: CGFloat = UIScreen.main.bounds.width / 1.2
        photoImageView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        photoImageView.image = UIImage(named: photo!)
    }
}

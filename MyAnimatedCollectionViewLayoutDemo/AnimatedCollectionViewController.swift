import UIKit
import AnimatedCollectionViewLayout

class AnimatedCollectionViewController: UICollectionViewController {
    let photo: [String] = ["icon_vert", "icon_artisan", "icon_blanc", "icon_chrom", "icon_firin", "icon_histoire", "icon_if", "icon_kukei", "icon_mai", "icon_neptune", "icon_noire", "icon_surara"]
    let width: CGFloat = UIScreen.main.bounds.width

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "動畫牆"
//加入動畫
        let layout = AnimatedCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: width)
//選擇動畫類型Cube
        layout.animator = CubeAttributesAnimator()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Photo", for: indexPath)
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: width, height: width)
        image.image = UIImage(named: photo[indexPath.row])
        cell.contentView.addSubview(image)
        return cell
    }

}

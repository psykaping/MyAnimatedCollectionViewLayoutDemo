import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    let photos: [String] = ["icon_vert", "icon_artisan", "icon_blanc", "icon_chrom", "icon_firin", "icon_histoire", "icon_if", "icon_kukei", "icon_mai", "icon_neptune", "icon_noire", "icon_surara"]
    let width: CGFloat = (UIScreen.main.bounds.width) / 3.2

    override func viewDidLoad() {
        super.viewDidLoad()
//設定title
        navigationController?.navigationBar.topItem?.title = "照片牆"
//設定間距及cell的大小
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout?.itemSize = CGSize(width: width, height: width)
    }
//設定cell的數目
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
//設定cell的內容物
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//加入圖片
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: width, height: width)
        image.image = UIImage(named: photos[indexPath.row])
        cell.contentView.addSubview(image)
        return cell
    }
//將資料傳至下一頁
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photo" {
        let indexPath = self.collectionView.indexPath(for: sender as! UICollectionViewCell)
        let photo = photos[indexPath!.row]
        let photoViewController = segue.destination as? PhotoViewController
            photoViewController!.photo = photo
        }
    }

}

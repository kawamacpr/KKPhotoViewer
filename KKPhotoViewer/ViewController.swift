import UIKit
import Photos

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: UIImageView!
}
 
class ViewController: UICollectionViewController {
    var fetchResult: PHFetchResult<AnyObject>!
    var imageManager: PHCachingImageManager!
    var cellSize: CGSize!
    
    override func awakeFromNib() {
        fetchResult = PHAsset.fetchAssets(with: nil) as! PHFetchResult<AnyObject>
        imageManager = PHCachingImageManager()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResult.count
    }
    
    override func collectionView(_ collectionView:
        UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CollectionViewCell
        if (cellSize == nil) {
            let imageBounds = cell.myImageView.bounds
            cellSize = CGSize(width: imageBounds.size.width, height: imageBounds.size.height)
        }
        
        let asset = self.fetchResult[indexPath.item] as! PHAsset
        self.imageManager.requestImage(for: asset, targetSize: cellSize, contentMode: .aspectFill, options: nil) {
            (image:UIImage!, info) ->
              Void in
            cell.myImageView.image = image
        }
    
    return cell
    }
}


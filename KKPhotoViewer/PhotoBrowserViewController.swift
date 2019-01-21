//
//  PhotoBrowserViewController.swift
//  KKPhotoViewer
//
//  Created by Kawamura Kazuhiro on 2019/01/21.
//  Copyright © 2019 Kawamura Kazuhiro. All rights reserved.
//

import UIKit
import Photos

class PhotoBrowserViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    var asset: PHAsset!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let givenasset = asset {
            let imageBounds = myImageView.bounds
            let imageManager = PHCachingImageManager()
           
            imageManager.requestImage(for: givenasset,
                targetSize: CGSize(width: imageBounds.size.width, height: imageBounds.size.height),
                contentMode: PHImageContentMode.aspectFill,
                options: nil) {
                (image: UIImage?,info) -> Void in
                 self.myImageView.image = image
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

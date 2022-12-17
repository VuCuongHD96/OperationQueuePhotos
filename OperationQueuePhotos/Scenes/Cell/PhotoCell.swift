//
//  PhotoCell.swift
//  OperationQueuePhotos
//
//  Created by Work on 17/12/2022.
//

import UIKit
import Reusable

class PhotoCell: UITableViewCell, NibReusable {
    
    @IBOutlet private var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupContent(urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                let imageData = try! Data(contentsOf: url)
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.photoImageView.image = image
                }
            }
        }
    }
}

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
    
    func setupContent(photo: Photo) {
        photoImageView?.image = photo.image
    }
}

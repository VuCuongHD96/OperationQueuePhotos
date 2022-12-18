//
//  DownLoadImageOperation.swift
//  OperationQueuePhotos
//
//  Created by Work on 18/12/2022.
//

import UIKit

class ImageDownLoaderOperation: Operation {
    
    var photo: Photo!
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    override func main() {
        downLoadImage(urlString: photo.urlString)
    }
    
    func downLoadImage(urlString: String) {
        if let url = URL(string: photo.urlString) {
            let imageData = try! Data(contentsOf: url)
            if let image = UIImage(data: imageData) {
                self.photo.image = image
                self.photo.state = .downloaded
            }
        }
    }
}

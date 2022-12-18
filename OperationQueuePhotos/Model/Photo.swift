//
//  Photo.swift
//  OperationQueuePhotos
//
//  Created by Work on 18/12/2022.
//

import UIKit

enum PhotoState {
    case new
    case downloaded
    case downloading
}

struct Photo {
    
    let urlString: String
    var state: PhotoState = .new
    var image = UIImage(named: "empty")
}

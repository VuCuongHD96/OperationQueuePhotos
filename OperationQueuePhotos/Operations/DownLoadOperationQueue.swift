//
//  DownLoadOperationQueue.swift
//  OperationQueuePhotos
//
//  Created by Work on 18/12/2022.
//

import Foundation

struct DownLoadOperationQueue {
    
    var downloadQueue = OperationQueue()
    
    init() {
        setupDownLoadQueue()
    }
    
    private func setupDownLoadQueue() {
        downloadQueue.name = "Download queue"
        downloadQueue.maxConcurrentOperationCount = 2
    }
}

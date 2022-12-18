//
//  ViewController.swift
//  OperationQueuePhotos
//
//  Created by Work on 17/12/2022.
//

import UIKit
import Reusable
import Then

final class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    var photoArray = [
        Photo(urlString: "https://images.pexels.com/photos/127160/pexels-photo-127160.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
        Photo(urlString: "https://vcdn1-dulich.vnecdn.net/2022/09/14/7-1663171465.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=h8Le5dwLusXpKrmsp_op5A"),
        Photo(urlString: "https://vcdn1-dulich.vnecdn.net/2022/09/14/4-1663171508.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=S06yaNXNAEw5yuUNPbsJYA"),
        Photo(urlString: "https://images.pexels.com/photos/54300/pexels-photo-54300.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
        Photo(urlString: "https://images.pexels.com/photos/1146242/pexels-photo-1146242.jpeg?cs=srgb&dl=pexels-olga-1146242.jpg&fm=jpg"),
        Photo(urlString: "https://photo2.tinhte.vn/data/attachment-files/2021/07/5557920_CV.jpg"),
        Photo(urlString: "https://vcdn1-dulich.vnecdn.net/2021/07/16/7-1-1626444923.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=1wDOcOPXJz8dNyWGp0e_hA"),
        Photo(urlString: "https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg"),
        Photo(urlString: "https://cdn.pixabay.com/photo/2020/04/30/14/03/mountains-and-hills-5112952__480.jpg"),
        Photo(urlString: "https://metricleo.com/wp-content/uploads/2021/03/word-image-23.jpeg")
    ]
    let downLoadOperationQueue = DownLoadOperationQueue()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - View
    private func setupView() {
        tableView.do {
            $0.register(cellType: PhotoCell.self)
            $0.dataSource = self
//            $0.rowHeight = 300
            $0.delegate = self
        }
    }
    
    // MARK: - Data
    private func downLoadImage(indexPath: IndexPath) {
        let row = indexPath.row
        var photo = photoArray[row]
        photo.state = .downloading
        let operation = ImageDownLoaderOperation(photo: photo)
        print("--- debug --- create operation = ", operation)
        operation.completionBlock = {
            print("--- debug --- urlstring done = ", operation.photo.state)
            self.photoArray[row] = operation.photo
            DispatchQueue.main.async {            
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        downLoadOperationQueue.downloadQueue.addOperation(operation)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let indicator = UIActivityIndicatorView(style: .medium)
//        indicator.color = .gray
//        indicator.startAnimating()
        let data = photoArray[indexPath.row]
        let cell: PhotoCell = tableView.dequeueReusableCell(for: indexPath)
        switch data.state {
        case .new:
            downLoadImage(indexPath: indexPath)
        case .downloaded:
            //        cell.setupContent(urlString: urlString)
            cell.setupContent(photo: data)
            //        cell.accessoryView = indicator
        case .downloading:
            break
        }
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

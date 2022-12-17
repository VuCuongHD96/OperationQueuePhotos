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
    
    let imageUrlArray = [
        "https://images.pexels.com/photos/127160/pexels-photo-127160.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "https://vcdn1-dulich.vnecdn.net/2022/09/14/7-1663171465.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=h8Le5dwLusXpKrmsp_op5A",
        "https://vcdn1-dulich.vnecdn.net/2022/09/14/4-1663171508.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=S06yaNXNAEw5yuUNPbsJYA",
        "https://images.pexels.com/photos/54300/pexels-photo-54300.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "https://images.pexels.com/photos/1146242/pexels-photo-1146242.jpeg?cs=srgb&dl=pexels-olga-1146242.jpg&fm=jpg",
        "https://photo2.tinhte.vn/data/attachment-files/2021/07/5557920_CV.jpg",
        "https://vcdn1-dulich.vnecdn.net/2021/07/16/7-1-1626444923.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=1wDOcOPXJz8dNyWGp0e_hA",
        "https://cdn.baogiaothong.vn/upload/2-2022/images/2022-05-25/2-1653445668-926-width740height481.jpg",
        "https://cdn.pixabay.com/photo/2020/04/30/14/03/mountains-and-hills-5112952__480.jpg",
        "https://metricleo.com/wp-content/uploads/2021/03/word-image-23.jpeg"
    ]
    
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
            $0.rowHeight = 100
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrlArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .gray
        indicator.startAnimating()
        let urlString = imageUrlArray[indexPath.row]
        let cell: PhotoCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupContent(urlString: urlString)
        cell.accessoryView = indicator
        return cell
    }
}

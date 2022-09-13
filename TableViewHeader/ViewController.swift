//
//  ViewController.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let model = [
        "New York",
        "London",
        "Baku",
        "Moscow",
        "Kyiv",
        "Lissabon",
        "Madrid",
        "Toronto",
        "Quba",
        "Miami",
        "California",
        "New York",
        "London",
        "Baku",
        "Moscow",
        "Kyiv",
        "Lissabon",
        "Madrid",
        "Toronto",
        "Quba",
        "Miami",
        "California",
        "New York",
        "London",
        "Baku",
        "Moscow",
        "Kyiv",
        "Lissabon",
        "Madrid",
        "Toronto",
        "Quba",
        "Miami",
        "California",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        let header = StretchyTableViewHeaderView(frame: CGRect(x: 0, y: 0,
                                                               width: view.frame.size.width,
                                                               height: view.frame.size.width * 2))
        header.imageView.image = UIImage(named: "aydin")
        
        header.nameLabel.text = "Aydin Aghayev"
        header.numberLabel.text = "+994556813441"
        tableView.tableHeaderView = header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableViewHeaderView else { return }
        header.scrollViewDidScroll(scrollView: tableView)
    }

}


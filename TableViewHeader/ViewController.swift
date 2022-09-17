//
//  ViewController.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    public var previousScrollOffset: CGFloat = 0
    let maxHeaderHeight: CGFloat = 780;
    let minHeaderHeight: CGFloat = 44;
    
    let model = ["Baku", "Baku","Baku","Baku","Baku","Baku","Baku","Baku","Baku","Baku","Baku",]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBarButtonItems()
        view.addSubview(myTableView)
    
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.frame = view.bounds
        myTableView.backgroundColor = .main
        
        let header = StretchyTableViewHeaderView(frame: CGRect(x: 0, y: 0,
                                                               width: view.frame.size.width,
                                                               height: 550))

        header.image = UIImage(named: "aydin")!
        header.name = "Aydin Aghayev"
        header.isOnline = true
        header.lastSeen = "Onlayn"
        header.nickName = "@aghay3v"
        header.phoneNumber = "+994 55 681 34 41"
    
        myTableView.tableHeaderView = header
    }
    
    func configureBarButtonItems() {
        title = "Mesajlar"
        navigationController?.navigationBar.backgroundColor = .main
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.primary]
        
        if #available(iOS 16.0, *) {
            
            let leftBarItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "arrow.backward"), target: self, action: #selector(leftMenuItemSelected))
                self.navigationItem.setLeftBarButton(leftBarItem, animated: false)
            leftBarItem.tintColor = .primary
            
            let rightBarItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "phone"), target: self, action: #selector(rightMenuItemSelected))
            rightBarItem.tintColor = .primary
            self.navigationItem.setRightBarButton(rightBarItem, animated: false)
        } else {
            
            let leftBtn = UIButton()
            leftBtn.setImage(UIImage(systemName: "phone"), for: .normal)
            leftBtn.addTarget(self, action: #selector(rightMenuItemSelected), for: .touchUpInside)
            let leftBarItem = UIBarButtonItem(customView: leftBtn)
            self.navigationItem.setRightBarButton(leftBarItem, animated: false)
            leftBtn.tintColor = .primary
            
            let rightBtn = UIButton()
            rightBtn.setImage(UIImage(systemName: "phone"), for: .normal)
            rightBtn.addTarget(self, action: #selector(rightMenuItemSelected), for: .touchUpInside)
            let rightBarItem = UIBarButtonItem(customView: rightBtn)
            self.navigationItem.setRightBarButton(rightBarItem, animated: false)
            rightBtn.tintColor = .primary
        }
    }
    
    @objc func leftMenuItemSelected() {
        print("Left button tapped")
    }
    @objc func rightMenuItemSelected() {
        print("Right button tapped")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        cell.backgroundColor = .main
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = myTableView.tableHeaderView as? StretchyTableViewHeaderView else { return }
        header.scrollViewDidScroll(scrollView: myTableView)
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        _ = scrollDiff > 0
        _ = scrollDiff < 0
        
        self.previousScrollOffset = scrollView.contentOffset.y
        
        let someView = UIStackView()
        someView.translatesAutoresizingMaskIntoConstraints = false
        someView.axis = .horizontal
        someView.alignment = .center
        someView.distribution = .fill
        someView.spacing = 20
        
        let uiImageview = UIImageView()
        let image = UIImage(named: "aydin")
        let height = (navigationController?.navigationBar.frame.size.height)!
        let roundedImage = image?.resize(withSize: CGSize(width: height, height: height), contentMode: .contentAspectFit)
        uiImageview.translatesAutoresizingMaskIntoConstraints = false
        uiImageview.image = roundedImage
        uiImageview.layer.cornerRadius = height / 2
        uiImageview.clipsToBounds = true
        uiImageview.contentMode = .scaleAspectFit

        let someLabel = UILabel()
        someLabel.font = .boldSystemFont(ofSize: 20)
        someLabel.text = "Aydin Aghayev"
        someLabel.textColor = .primary
        
        someView.addArrangedSubview(uiImageview)
        
//        if scrollView.contentOffset.y > 110 {
//            navigationItem.titleView = someView
//        } else {
//            navigationItem.title = ""
//            navigationItem.titleView = nil
//        }
//        
//        if scrollView.contentOffset.y > 155 {
//            someView.addArrangedSubview(someLabel)
//        }
        
        print(scrollView.contentOffset.y)
    }
}


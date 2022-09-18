//
//  ViewController.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

class ViewController: UIViewController {

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
                                                               height: 530))

        header.image = UIImage(named: "aydin")!
        header.name = "Aydin Aghayev"
        header.isOnline = true
        header.lastSeen = "Onlayn"
        header.nickName = "@aghay3v"
        header.phoneNumber = "+994 55 681 34 41"
    
        myTableView.tableHeaderView = header
        registerNotification()
    }
    
    func registerNotification() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(segmentIndexValueDidChange), name: .segmentioIndexDidChange, object: nil)
    }
    
    @objc func segmentIndexValueDidChange(_ notification: Notification) {
        let value = notification.object as? [String: Int] ?? [:]
        let changedValue = value["index"] ?? 0
        print(changedValue)
    }
    
    func configureBarButtonItems() {
        title = "Mesajlar"
        
        let style = UINavigationBarAppearance()
//        style.backgroundColor = .clear
        style.configureWithTransparentBackground()
        style.titleTextAttributes = [.foregroundColor: UIColor.primary]
        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.backgroundColor = .main
        navigationController?.navigationBar.standardAppearance = style
        navigationController?.navigationBar.scrollEdgeAppearance = style
        
        let leftBarItem = configureBarButton(with: "arrow.backward", selector: #selector(rightMenuItemSelected))
        self.navigationItem.setLeftBarButton(leftBarItem, animated: false)
        let rightBarItem = configureBarButton(with: "phone", selector: #selector(rightMenuItemSelected))
        self.navigationItem.setRightBarButton(rightBarItem, animated: false)
    }
    
    @objc func leftMenuItemSelected() {
        print("Left button tapped")
    }
    @objc func rightMenuItemSelected() {
        print("Right button tapped")
    }
    
    func configureBarButton(with name: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(UIImage(systemName: name), for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 22), forImageIn: .normal)
        button.tintColor = .primary
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        cell.backgroundColor = .main
        cell.textLabel?.textColor = .primary
        cell.selectionStyle = .none
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
        
        //        let someView = UIStackView()
        //        someView.translatesAutoresizingMaskIntoConstraints = false
        //        someView.axis = .horizontal
        //        someView.alignment = .center
        //        someView.distribution = .fill
        //        someView.spacing = 20
        ////
        //        let uiImageview = UIImageView()
        //        let image = UIImage(named: "aydin")
        //        let height = (navigationController?.navigationBar.frame.size.height)!
        //        let roundedImage = image?.resize(withSize: CGSize(width: height, height: height), contentMode: .contentAspectFit)
        //        uiImageview.translatesAutoresizingMaskIntoConstraints = false
        //        uiImageview.image = roundedImage
        //        uiImageview.layer.cornerRadius = height / 2
        //        uiImageview.clipsToBounds = true
        //        uiImageview.contentMode = .scaleAspectFit
        //
        //        let someLabel = UILabel()
        //        someLabel.font = .boldSystemFont(ofSize: 20)
        //        someLabel.text = "Aydin Aghayev"
        //        someLabel.textColor = .primary
        
        //        someView.addArrangedSubview(uiImageview)
        
                if scrollView.contentOffset.y > -80 {
                    title = ""
                    if #available(iOS 16.0, *) {
                        navigationItem.rightBarButtonItem?.isHidden = true
                    }
                    if #available(iOS 16.0, *) {
                        navigationItem.leftBarButtonItem?.isHidden = true
                    }
                } else {
                    title = "Mesajlar"
                    if #available(iOS 16.0, *) {
                        navigationItem.rightBarButtonItem?.isHidden = false
                    }
                    if #available(iOS 16.0, *) {
                        navigationItem.leftBarButtonItem?.isHidden = false
                    }
                }
        
        print(scrollView.contentOffset.y)
    }
}


//
//  ViewController.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToHeaderView(_ sender: Any) {
        navigationController?.pushViewController(HeaderView(), animated: true)
    }
}



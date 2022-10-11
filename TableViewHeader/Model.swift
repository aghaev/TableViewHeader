//
//  Model.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 19.09.22.
//

import UIKit

struct Model {
    
    let image: UIImage
    let name: String
    let isOnline: Bool
    let lastSeen: String
    let nickName: String
    let phoneNumber: String
    
    init(image: UIImage, name: String, isOnline: Bool, lastSeen: String, nickName: String, phoneNumber: String) {
        self.image = image
        self.name = name
        self.isOnline = isOnline
        self.lastSeen = lastSeen
        self.nickName = nickName
        self.phoneNumber = phoneNumber
    }
}

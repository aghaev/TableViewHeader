//
//  UIcolor+Extension.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit
extension CGColor {
    static var primaryCg: CGColor {
        return #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1).cgColor
    }
}
extension UIColor {
    static var primary: UIColor {
        return #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
    }
    static var bgColor: UIColor {
        return #colorLiteral(red: 0.6470588235, green: 0.6862745098, blue: 0.6784313725, alpha: 1)
    }
    static var grayText: UIColor {
        return #colorLiteral(red: 0.4470588235, green: 0.4862745098, blue: 0.4784313725, alpha: 1)
    }
    static var secondaryGray: UIColor {
        return #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
    }
    static var main: UIColor {
        return #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9254901961, alpha: 1)
    }
    static var secondaryRed: UIColor {
        return #colorLiteral(red: 0.8899999857, green: 0.2980000079, blue: 0.2980000079, alpha: 1)
    }
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner,with radius: [CGFloat]) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius[0], height: radius[0]))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UIImage {
    enum ContentMode {
        case contentFill
        case contentAspectFill
        case contentAspectFit
    }
    
    func resize(withSize size: CGSize, contentMode: ContentMode = .contentAspectFill) -> UIImage? {
        let aspectWidth = size.width / self.size.width
        let aspectHeight = size.height / self.size.height
        
        switch contentMode {
            case .contentFill:
                return resize(withSize: size)
            case .contentAspectFit:
                let aspectRatio = min(aspectWidth, aspectHeight)
                return resize(withSize: CGSize(width: self.size.width * aspectRatio, height: self.size.height * aspectRatio))
            case .contentAspectFill:
                let aspectRatio = max(aspectWidth, aspectHeight)
                return resize(withSize: CGSize(width: self.size.width * aspectRatio, height: self.size.height * aspectRatio))
        }
    }
    
    private func resize(withSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

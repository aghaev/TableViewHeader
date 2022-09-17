//
//  CSegControl.swift
//  CustomSegmentedControl
//
//  Created by Aydin Aghayev on 12.09.22.
//

import UIKit

class CSegControl: UIControl {
    
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    var scrollViewWidth: CGFloat = 0
    let scrollView = UIScrollView()
    
    let commaSeparatedTitles: String = "Linklər,Qruplar,Qalereya,Fayllar,Səsli messajlar"
    let textColor: UIColor = UIColor(hexString: "#BEBEBE")
    let selectorColor: UIColor = UIColor(hexString: "#BEBEBE")
    let selectorTextColor: UIColor = UIColor(hexString: "#52796F")
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        
        let buttonTitles = commaSeparatedTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        addSubview(scrollView)
//        scrollView.backgroundColor = .main
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: .zero, height: frame.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        
        let sv = UIStackView(arrangedSubviews: buttons)
        scrollView.addSubview(sv)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.spacing = 20
        sv.isLayoutMarginsRelativeArrangement = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        sv.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        sv.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
        let selectorWidth = scrollView.bounds.width / CGFloat(buttons.count)
        let selectorHeight = scrollView.bounds.height
        selector = UIView(frame: CGRect(x: 0, y: selectorHeight - 5, width: selectorWidth, height: 1))
        selector.backgroundColor = selectorColor
        scrollView.addSubview(selector)
    }
    
    override func layoutSubviews() {
        updateView()
    }
    
    @objc func buttonTapped(button: UIButton) {
        scrollViewWidth = scrollView.frame.width
        
        for (btnIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = btnIndex
                let selectorStartPosition = scrollViewWidth / CGFloat(buttons.count) * CGFloat(btnIndex)
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                button.setTitleColor(selectorTextColor, for: .normal)
                
// let data: [String: Int] = ["conversation": selectedSegmentIndex]
// NotificationCenter.default.post(name: .segmentChanged, object: nil, userInfo: data)
            }
        }
        sendActions(for: .valueChanged)
        
        
    }

}

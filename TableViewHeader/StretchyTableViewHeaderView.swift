//
//  StretchyTableViewHeaderView.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

final class StretchyTableViewHeaderView: UIView {
    
    public var image: UIImage = UIImage()
    public var name: String = ""
    public var isOnline: Bool = true
    public var lastSeen: String = ""
    
    init(image: UIImage, name: String, isOnline: Bool, lastSeen: String) {
        self.image = image
        self.name = name
        self.isOnline = isOnline
        self.lastSeen = lastSeen
    }
    
    private let profileStackView = UIView().createProfileView(with: self.image,
                                                              name: name,
                                                              isOnline: isOnline,
                                                              lastSeen: lastSeen)
    
    private let topSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    private let bottomSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hexString: "344F52")
        return label
    }()
    
    
    
    private let nickNameStack = UIView().createStack(with: "Istifadechi adi",
                                                     secondLabel: "@aghayev",
                                                     switchView: nil,
                                                     isOn: nil)
    
    private let phoneStack = UIView().createStack(with: "Mobil nomre",
                                                  secondLabel: "+994 55 681 34 41",
                                                  switchView: nil,
                                                  isOn: nil)
    
    private let notificationStackView = UIView().createStack(with: "Bildirish",
                                                            secondLabel: "Aktiv",
                                                            switchView: UISwitch(),
                                                            isOn: false)
    
    private let silenceStackView = UIView().createStack(with: "Mute",
                                                        secondLabel: "Deaktiv",
                                                        switchView: UISwitch(),
                                                        isOn: true)
    
    
    private let wallpaperLabel: UILabel = {
        let label = UILabel()
        label.text = "Divar kagizi sec"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .primary
        return label
    }()
    
    private let melodyStack = UIView().createStack(with: "Ses tonunu sec",
                                                   secondLabel: "Imagine Dragons - Bones",
                                                   switchView: nil, isOn: nil)
    
    private let blockStack = UIView().createStack(with: "Bloklamaq",
                                                  secondLabel: "Blok et",
                                                  switchView: UISwitch(),
                                                  isOn: true)
    
    public let segmentedControl = CSegControl()
    
    private var imageViewHeidht = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
    private let minHeaderHeight: CGFloat = 44

    override init(frame: CGRect) {
        super.init(frame: frame)
        newUI()
        createNewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // max 417
    // min -47
    // height = 464
    
    private func newUI() {
        addSubview(containerView)
        containerView.backgroundColor = .main
        containerView.addSubview(profileStackView)
        containerView.addSubview(topSeparator)
        containerView.addSubview(infoLabel)
        containerView.addSubview(nickNameStack)
        containerView.addSubview(phoneStack)
        containerView.addSubview(notificationStackView)
        containerView.addSubview(silenceStackView)
        containerView.addSubview(wallpaperLabel)
        containerView.addSubview(melodyStack)
        containerView.addSubview(blockStack)
        containerView.addSubview(bottomSeparator)
        containerView.addSubview(segmentedControl)
    }
    
    private func createNewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: 32),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        profileStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        profileStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        profileStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        topSeparator.translatesAutoresizingMaskIntoConstraints = false
        topSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        topSeparator.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: 16).isActive = true
        topSeparator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
        topSeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -16).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 16).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        nickNameStack.translatesAutoresizingMaskIntoConstraints = false
        nickNameStack.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16).isActive = true
        nickNameStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        nickNameStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        phoneStack.translatesAutoresizingMaskIntoConstraints = false
        phoneStack.topAnchor.constraint(equalTo: nickNameStack.bottomAnchor, constant: 16).isActive = true
        phoneStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        phoneStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        notificationStackView.translatesAutoresizingMaskIntoConstraints = false
        notificationStackView.topAnchor.constraint(equalTo: phoneStack.bottomAnchor, constant: 16).isActive = true
        notificationStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        notificationStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        notificationStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        silenceStackView.translatesAutoresizingMaskIntoConstraints = false
        silenceStackView.topAnchor.constraint(equalTo: notificationStackView.bottomAnchor, constant: 16).isActive = true
        silenceStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        silenceStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        silenceStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        wallpaperLabel.translatesAutoresizingMaskIntoConstraints = false
        wallpaperLabel.topAnchor.constraint(equalTo: silenceStackView.bottomAnchor, constant: 16).isActive = true
        wallpaperLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        wallpaperLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        melodyStack.translatesAutoresizingMaskIntoConstraints = false
        melodyStack.topAnchor.constraint(equalTo: wallpaperLabel.bottomAnchor, constant: 16).isActive = true
        melodyStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        melodyStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        blockStack.translatesAutoresizingMaskIntoConstraints = false
        blockStack.topAnchor.constraint(equalTo: melodyStack.bottomAnchor, constant: 16).isActive = true
        blockStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        blockStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomSeparator.topAnchor.constraint(equalTo: blockStack.bottomAnchor, constant: 16).isActive = true
        bottomSeparator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
        bottomSeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -16).isActive = true
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: bottomSeparator.bottomAnchor, constant: 16).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let ofsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = ofsetY <= 0
        imageViewBottom.constant = ofsetY >= 0 ? 0: -ofsetY / 2
        imageViewHeidht.constant = max(ofsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        print(scrollView.contentSize.height)
    }
}

//
//  StretchyTableViewHeaderView.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

final class StretchyTableViewHeaderView: UIView {
    
    public let profileStackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.axis = .horizontal
        sv.alignment = .center
        sv.spacing = 24
        return sv
    }()
    
    public let profileVerticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.axis = .vertical
        sv.alignment = .leading
        return sv
    }()
    
    let lastSeenLabel: UILabel = {
        let label = UILabel()
        label.text = "Onlayn" // temprorary
        label.font = .systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    public let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.layer.cornerRadius = 25
        imageView.layer.borderColor = .primaryCg
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    public let onlineView: UIView = {
        let onlineView = UIView()
        onlineView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        onlineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        onlineView.backgroundColor = .clear
        return onlineView
    }()
    
    public let onlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.layer.cornerRadius = 7
        imageView.backgroundColor = .green
        return imageView
    }()
    
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .primary
        return label
    }()
    
    public let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = .primary
        return label
    }()
    
    public let buttonsStackView: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .fillProportionally
        sv.axis = .horizontal
        sv.alignment = .center
        return sv
    }()
    
    public let messageButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "envelope.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let emptyButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 64)
        let image = UIImage(systemName: "envelo", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let emptyButton1: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 64)
        let image = UIImage(systemName: "envelo", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let voiceCallButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "phone.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let videoCallButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "video.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let muteButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "speaker.slash.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let deleteButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "trash.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let searchButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .primary
        return button
    }()
    
    public let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .primary
        return separator
    }()
    
    public let blockLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Bloklamag"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .primary
        return label
    }()
    
    public let detailedBlockLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Blokl et"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .primary
        return label
    }()
    
    public let blockSwitch : UISwitch = {
        let blockSwitch = UISwitch()
        return blockSwitch
    }()
    
    public let separator1: UIView = {
        let separator = UIView()
        separator.backgroundColor = .primary
        return separator
    }()
    
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
    
    public func newUI() {
        addSubview(containerView)
        onlineView.addSubview(profileImageView)
        onlineView.addSubview(onlineImageView)
        profileStackView.addArrangedSubview(onlineView)

        
        profileVerticalStackView.addArrangedSubview(nameLabel)
        profileVerticalStackView.addArrangedSubview(lastSeenLabel)
        profileStackView.addArrangedSubview(profileVerticalStackView)
        containerView.addSubview(profileStackView)
        

    }
    
    func createNewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerXAnchor.constraint(equalTo: onlineView.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: onlineView.centerYAnchor).isActive = true
        
        
        onlineImageView.translatesAutoresizingMaskIntoConstraints = false
        onlineImageView.trailingAnchor.constraint(equalTo: onlineView.trailingAnchor).isActive = true
        onlineImageView.bottomAnchor.constraint(equalTo: onlineView.bottomAnchor).isActive = true
        
        
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        profileStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        profileStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -16).isActive = true
        profileStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
    }
    
    func oldUI() {
        addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(numberLabel)
        containerView.addSubview(buttonsStackView)
        containerView.addSubview(separator)
        buttonsStackView.addArrangedSubview(emptyButton)
        buttonsStackView.addArrangedSubview(messageButton)
        buttonsStackView.addArrangedSubview(voiceCallButton)
        buttonsStackView.addArrangedSubview(videoCallButton)
        buttonsStackView.addArrangedSubview(muteButton)
        buttonsStackView.addArrangedSubview(deleteButton)
        buttonsStackView.addArrangedSubview(searchButton)
        buttonsStackView.addArrangedSubview(emptyButton1)
        containerView.addSubview(blockLabel)
        containerView.addSubview(detailedBlockLabel)
        containerView.addSubview(blockSwitch)
        containerView.addSubview(separator1)
        containerView.addSubview(segmentedControl)
    }
    
    func setViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.layer.cornerRadius = 100
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 16).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 16).isActive = true
        separator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        blockLabel.translatesAutoresizingMaskIntoConstraints = false
        blockLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 16).isActive = true
        blockLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        
        detailedBlockLabel.translatesAutoresizingMaskIntoConstraints = false
        detailedBlockLabel.topAnchor.constraint(equalTo: blockLabel.bottomAnchor).isActive = true
        detailedBlockLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        
        blockSwitch.translatesAutoresizingMaskIntoConstraints = false
        blockSwitch.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 16).isActive = true
        blockSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        
        separator1.translatesAutoresizingMaskIntoConstraints = false
        separator1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator1.topAnchor.constraint(equalTo: blockSwitch.bottomAnchor, constant: 16).isActive = true
        separator1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        separator1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 16).isActive = true
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

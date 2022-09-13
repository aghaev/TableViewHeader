//
//  StretchyTableViewHeaderView.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit

final class StretchyTableViewHeaderView: UIView {
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return label
    }()
    
    public let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return label
    }()
    
    public let buttonsStackView: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.alignment = .center
//        sv.spacing = 30
        return sv
    }()
    
    public let messageButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "envelope.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.tintColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return button
    }()
    
    public let voiceCallButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "phone.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.tintColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return button
    }()
    
    public let videoCallButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "video.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.tintColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return button
    }()
    
    public let muteButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "speaker.slash.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.tintColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return button
    }()
    
    public let deleteButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "trash.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.tintColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return button
    }()
    
    public let searchButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.tintColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return button
    }()
    
    public let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        return separator
    }()
    
    let blockLabel: UILabel = {
        let label = UILabel()
        label.text = "Bloklamag"
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    private var imageViewHeidht = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func createViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(numberLabel)
        containerView.addSubview(buttonsStackView)
        containerView.addSubview(separator)
        buttonsStackView.addArrangedSubview(messageButton)
        buttonsStackView.addArrangedSubview(voiceCallButton)
        buttonsStackView.addArrangedSubview(videoCallButton)
        buttonsStackView.addArrangedSubview(muteButton)
        buttonsStackView.addArrangedSubview(deleteButton)
        buttonsStackView.addArrangedSubview(searchButton)
        containerView.addSubview(blockLabel)
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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.layer.cornerRadius = 100
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = #colorLiteral(red: 0.3215686275, green: 0.4745098039, blue: 0.4352941176, alpha: 1)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 16).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 64).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -64).isActive = true
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraint(equalTo: messageButton.bottomAnchor, constant: 16).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
//        blockLabel.topAnchor.constraint(equalTo: separator.bottomAnchor).isActive = true
//        blockLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        
        NSLayoutConstraint.activate([
            messageButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor),
            voiceCallButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor),
            videoCallButton.leadingAnchor.constraint(equalTo: voiceCallButton.trailingAnchor),
            muteButton.leadingAnchor.constraint(equalTo: videoCallButton.trailingAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: muteButton.trailingAnchor),
            searchButton.leadingAnchor.constraint(equalTo: deleteButton.trailingAnchor)
        ])
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let ofsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = ofsetY <= 0
        imageViewBottom.constant = ofsetY >= 0 ? 0: -ofsetY / 2
        imageViewHeidht.constant = max(ofsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}

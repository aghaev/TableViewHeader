//
//  TableViewHeader.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 19.09.22.
//

import UIKit

final class TableViewHeader: UIView {
    
    var model: Model? {
        didSet{
            updateData()
        }
    }
    
    private var containerView = UIView()
    private lazy var onlineView: UIView = {
        let onlineView = UIView()
        onlineView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        onlineView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        onlineView.backgroundColor = .clear
        return onlineView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private lazy var onlineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .primary
        return label
    }()
    
    private lazy var lastSeenLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.textColor = .primary
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profileStack = configureProfileStackView(with: onlineView, profile: profileImageView, onlineImage: onlineImageView, name: nameLabel, lastSeent: lastSeenLabel)
    
    func setUpUI() {
        addSubview(containerView)
        containerView.addSubview(profileStack)
        
    }
    
    func setupConstraints() {   
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        profileStack.translatesAutoresizingMaskIntoConstraints = false
        profileStack.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        profileStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        profileStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
        profileStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func updateData() {
        guard let model = model else {return}
        profileImageView.image = model.image
        onlineImageView.backgroundColor = model.isOnline ? .onlineGreen : .clear
        nameLabel.text = model.name
        lastSeenLabel.text = model.lastSeen
    }
    
    
}

extension TableViewHeader {
    func configureProfileStackView (with onlineView: UIView, profile: UIImageView, onlineImage: UIImageView, name: UILabel, lastSeent: UILabel) -> UIStackView {
        
        let profileStackView: UIStackView = {
            let sv = UIStackView()
            sv.distribution = .fill
            sv.axis = .horizontal
            sv.alignment = .center
            sv.spacing = 24
            return sv
        }()
        
        let profileVerticalStackView: UIStackView = {
            let sv = UIStackView()
            sv.distribution = .fillProportionally
            sv.axis = .vertical
            sv.alignment = .leading
            return sv
        }()
        
        onlineView.addSubview(profile)
        onlineView.addSubview(onlineImage)
        profileStackView.addArrangedSubview(onlineView)
        profileVerticalStackView.addArrangedSubview(name)
        profileVerticalStackView.addArrangedSubview(lastSeent)
        profileStackView.addArrangedSubview(profileVerticalStackView)
        onlineView.translatesAutoresizingMaskIntoConstraints = false
        profile.translatesAutoresizingMaskIntoConstraints = false
        onlineImage.translatesAutoresizingMaskIntoConstraints = false
        
        profile.centerXAnchor.constraint(equalTo: onlineView.centerXAnchor).isActive = true
        profile.centerYAnchor.constraint(equalTo: onlineView.centerYAnchor).isActive = true
        onlineImage.trailingAnchor.constraint(equalTo: onlineView.trailingAnchor).isActive = true
        onlineImage.bottomAnchor.constraint(equalTo: onlineView.bottomAnchor).isActive = true
        
        return profileStackView
    }
}

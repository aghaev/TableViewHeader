//
//  StretchyTableViewHeaderView.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 13.09.22.
//

import UIKit
import Segmentio

enum Switchs {
    case notification
    case silent
    case block
}

final class StretchyTableViewHeaderView: UIView {
    
    public var image: UIImage = UIImage()
    public var name: String = ""
    public var isOnline: Bool = true
    public var lastSeen: String = "" {
        didSet{
//            updateData()
            profileStackView = UIView().createProfileView(with: self.image,
                                                          name: self.name,
                                                          isOnline: self.isOnline,
                                                          lastSeen: self.lastSeen)
        }
    }
    public var nickName: String = "" {
        didSet{
            updateData()
        }
    }
    public var phoneNumber: String = "" {
        didSet{
            updateData()
        }
    }
    
    private lazy var topSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(hexString: "344F52")
        return label
    }()
    
    private lazy var profileStackView = UIStackView()
    
    private lazy var nickNameStack = UIStackView()
    
    private lazy var phoneStack = UIStackView()
    
    private lazy var notificationStackView = UIView().createStack(with: "Bildiriş",
                                                                  secondLabel: "Aktiv",
                                                                  switchView: UISwitch(),
                                                                  switchCases: .notification,
                                                                  isOn: false)
    
    private lazy var silenceStackView = UIView().createStack(with: "Mute",
                                                             secondLabel: "Deaktiv",
                                                             switchView: UISwitch(),
                                                             switchCases: .silent,
                                                             isOn: true)
    
    private lazy var wallpaperStackView = UIView().createStack(with: "Divar kağızı seç",
                                                           secondLabel: "Standart",
                                                           switchView: nil,
                                                           switchCases: nil,
                                                           isOn: nil)
    
    private lazy var melodyStack = UIView().createStack(with: "Səs tonu seç",
                                                        secondLabel: "Imagine Dragons - Bones",
                                                        switchView: nil,
                                                        switchCases: nil,
                                                        isOn: nil)
    
    private lazy var blockStack = UIView().createStack(with: "Bloklamaq",
                                                       secondLabel: "Blok et",
                                                       switchView: UISwitch(),
                                                       switchCases: .block,
                                                       isOn: true)
    
    func registerNotification() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(switchValueChanged), name: .switchValueChanged, object: nil)
    }
    
    @objc func switchValueChanged(_ notification: Notification) {
        guard let value = notification.object as? [Int:Bool] else {return}
        value.forEach { (key, value) in
            switch key {
            case 1:
                print("Notification switch value changed. Value is:", value)
            case 2:
                print("Silence switch value changed. Value is:", value)
            default:
                print("Block switch value changed. Value is:", value)
            }
        }
    }
    
    private lazy var bottomSeparator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    public let segmentedControl = CSegControl()
    
    private var imageViewHeidht = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
    private let minHeaderHeight: CGFloat = 44
    
    let segmentioView: Segmentio = Segmentio()
    var content = [SegmentioItem]()
    
    var links = SegmentioItem (
        title: "Linklər",
        image: UIImage(systemName: "link")
    )
    
    let groups = SegmentioItem (
        title: "Qruplar",
        image: UIImage(systemName: "person.3")
    )
    
    let gallery = SegmentioItem (
        title: "Qalereya",
        image: UIImage(systemName: "photo")
    )
    
    let files = SegmentioItem (
        title: "Fayllar",
        image: UIImage(systemName: "folder")
    )
    
    let voiceRecords = SegmentioItem (
        title: "Səsli messajlar",
        image: UIImage(systemName: "mic")
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNotification()
        updateData()
        configureUI()
        configureConstraints()
        confSegmentio()
        
        segmentioView.valueDidChange = { segmentio, segmentIndex in
            print("Selected item: ", segmentIndex)
            let nc = NotificationCenter.default
            nc.post(name: .segmentioIndexDidChange, object: ["index": segmentIndex])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // max 417
    // min -47
    // height = 464
    
    private func configureUI() {
        addSubview(containerView)
        containerView.backgroundColor = .main
        containerView.addSubview(profileStackView)
        containerView.addSubview(topSeparator)
        containerView.addSubview(infoLabel)
        containerView.addSubview(nickNameStack)
        containerView.addSubview(phoneStack)
        containerView.addSubview(notificationStackView)
        containerView.addSubview(silenceStackView)
        containerView.addSubview(wallpaperStackView)
        containerView.addSubview(melodyStack)
        containerView.addSubview(blockStack)
//        containerView.addSubview(bottomSeparator)
        containerView.addSubview(segmentioView)
    }
    
    func confSegmentio() {
        content.append(links)
        content.append(groups)
        content.append(gallery)
        content.append(files)
        content.append(voiceRecords)
        segmentioView.selectedSegmentioIndex = 0
        setup()
    }
    
    func setup() {
        func segmentioState(backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
            return SegmentioState(
                backgroundColor: backgroundColor,
                titleFont: titleFont,
                titleTextColor: titleTextColor
            )
        }
    
        func segmentioStates() -> SegmentioStates {
            let defaultFont = UIFont.systemFont(ofSize: 16, weight: .regular)
            let selectedFont = UIFont.systemFont(ofSize: 20, weight: .bold)
            let highlightedFont = UIFont.systemFont(ofSize: 16, weight: .thin)
            return SegmentioStates(
                defaultState: segmentioState(
                    backgroundColor: .clear,
                    titleFont: defaultFont,
                    titleTextColor: .primary
                ),
                selectedState: segmentioState(
                    backgroundColor: .clear,
                    titleFont: selectedFont,
                    titleTextColor: .primary
                    
                ),
                highlightedState: segmentioState(
                    backgroundColor: .clear,
                    titleFont: highlightedFont,
                    titleTextColor: .primary
                )
            )
        }
        
        let options: SegmentioOptions = SegmentioOptions(backgroundColor: .clear, segmentPosition: .dynamic, scrollEnabled: true, indicatorOptions: .init(type: .bottom, ratio: 0.6, height: 1, color: .primary), horizontalSeparatorOptions: .none, verticalSeparatorOptions: .none, imageContentMode: .center, labelTextAlignment: .left, labelTextNumberOfLines: 1, segmentStates: segmentioStates(), animationDuration: 0.1)
        
        segmentioView.setup(
            content: content,
            style: .onlyLabel,
            options: options
        )
        
    }
    
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let ofsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        print("scrollView.contentSize.height", scrollView.contentSize.height)
    }
    
    func updateData() {
        nickNameStack = UIView().createStack(with: "İstifadəçi adı",
                                             secondLabel: self.nickName,
                                             switchView: nil,
                                             switchCases: nil,
                                             isOn: nil)
        
        phoneStack = UIView().createStack(with: "Mobil nömrə",
                                          secondLabel: self.phoneNumber,
                                          switchView: nil,
                                          switchCases: nil,
                                          isOn: nil)
        
        containerView.subviews.forEach({ subview in
            subview.removeFromSuperview()
        })
        configureUI()
        configureConstraints()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: 32),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
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
        
        wallpaperStackView.translatesAutoresizingMaskIntoConstraints = false
        wallpaperStackView.topAnchor.constraint(equalTo: silenceStackView.bottomAnchor, constant: 16).isActive = true
        wallpaperStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        wallpaperStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        melodyStack.translatesAutoresizingMaskIntoConstraints = false
        melodyStack.topAnchor.constraint(equalTo: wallpaperStackView.bottomAnchor, constant: 16).isActive = true
        melodyStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        melodyStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        blockStack.translatesAutoresizingMaskIntoConstraints = false
        blockStack.topAnchor.constraint(equalTo: melodyStack.bottomAnchor, constant: 16).isActive = true
        blockStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        blockStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
//        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
//        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
//        bottomSeparator.topAnchor.constraint(equalTo: blockStack.bottomAnchor, constant: 16).isActive = true
//        bottomSeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -16).isActive = true
//        bottomSeparator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
        
        segmentioView.translatesAutoresizingMaskIntoConstraints = false
        segmentioView.topAnchor.constraint(equalTo: blockStack.bottomAnchor, constant: 16).isActive = true
        segmentioView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentioView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -24).isActive = true
        segmentioView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
    }
}

extension Notification.Name {
    static var segmentioIndexDidChange = Notification.Name("segmentioIndexDidChange")
    static var switchValueChanged = Notification.Name("switchValueChanged")
}

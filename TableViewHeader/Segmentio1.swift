//
//  Segmentio.swift
//  TableViewHeader
//
//  Created by Aydin Aghayev on 18.09.22.
//

import UIKit
import Segmentio

class SegmentioView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var segmentioView: Segmentio = Segmentio()
    var content = [SegmentioItem]()
    
    let links = SegmentioItem(
        title: "Linklər",
        image: UIImage(systemName: "link")
    )
    
    let groups = SegmentioItem(
        title: "Qruplar",
        image: UIImage(systemName: "person.3")
    )
    
    let gallery = SegmentioItem(
        title: "Qalereya",
        image: UIImage(systemName: "photo")
    )
    
    let files = SegmentioItem(
        title: "Fayllar",
        image: UIImage(systemName: "folder")
    )
    
    let voiceRecords = SegmentioItem(
        title: "Səsli messajlar",
        image: UIImage(systemName: "mic")
    )
    func qwe() {
        content.append(links)
        content.append(groups)
        content.append(gallery)
        content.append(files)
        content.append(voiceRecords)
    }
    
    func segmentioState(backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
        return SegmentioState(
            backgroundColor: backgroundColor,
            titleFont: titleFont,
            titleTextColor: titleTextColor
        )
    }
    
    func segmentioStates() -> SegmentioStates {
        let font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return SegmentioStates(
            defaultState: segmentioState(
                backgroundColor: .clear,
                titleFont: font,
                titleTextColor: .primary
            ),
            selectedState: segmentioState(
                backgroundColor: .clear,
                titleFont: font,
                titleTextColor: .gray
                
            ),
            highlightedState: segmentioState(
                backgroundColor: .clear,
                titleFont: font,
                titleTextColor: .primary
            )
        )
    }
    func setup() {
        
        let options: SegmentioOptions = SegmentioOptions(backgroundColor: .main, segmentPosition: .dynamic, scrollEnabled: true, indicatorOptions: .init(type: .bottom, ratio: 0.6, height: 1, color: .primary), horizontalSeparatorOptions: .none, verticalSeparatorOptions: .none, imageContentMode: .center, labelTextAlignment: .left, labelTextNumberOfLines: 1, segmentStates: segmentioStates(), animationDuration: 0.1)
        
        segmentioView.setup(
            content: content,
            style: .onlyLabel,
            options: options
        )
        addSubview(segmentioView)
    }

}

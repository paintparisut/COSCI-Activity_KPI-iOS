//
//  CustomSegment.swift
//  cosci-activity-kpi
//
//  Created by Nattapon Suwanno on 19/4/2566 BE.
//

import UIKit

class CustomSegment: UISegmentedControl {
    
    private(set) lazy var radius:CGFloat = 12
    
    private var segmentInset: CGFloat = 0.1{
        didSet{
            if segmentInset == 0{
                segmentInset = 0.1
            }
        }
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        selectedSegmentIndex = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = self.radius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.frame.size.height = 32.0
        self.layer.masksToBounds = true
        
        let selectedViewIndex = numberOfSegments
        if let selectedView = subviews[selectedViewIndex] as? UIImageView
        {
            selectedView.backgroundColor = .white
            selectedView.image = nil
            
            selectedView.bounds = selectedView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            
            selectedView.layer.masksToBounds = true
            selectedView.layer.cornerRadius = 0
            selectedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            selectedView.layer.removeAnimation(forKey: "SelectionBounds")
        }
    }
}

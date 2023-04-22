//
//  CustomShadowCard.swift
//  cosci-activity-kpi
//
//  Created by Nattapon Suwanno on 23/4/2566 BE.
//

import UIKit

class CustomShadowCard: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5
        
    }

}

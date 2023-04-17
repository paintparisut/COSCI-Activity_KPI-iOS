//
//  CustomLable.swift
//  cosci-activity-kpi
//
//  Created by Nattapon Suwanno on 14/4/2566 BE.
//

import UIKit

class CustomLable: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
//        self.font = UIFont(name: Constants.ConstantFont.Regular, size: 14)
    }
}

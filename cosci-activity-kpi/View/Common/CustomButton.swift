//
//  CustomButton.swift
//  cosci-activity-kpi
//
//  Created by Nattapon Suwanno on 14/4/2566 BE.
//

import UIKit

final class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.titleLabel?.font = UIFont(name: ConstantsInterface.ConstantFont.Medium, size: 16)
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
    }
}




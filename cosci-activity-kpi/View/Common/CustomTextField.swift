//
//  CustomTextField.swift
//  cosci-activity-kpi
//
//  Created by Nattapon Suwanno on 14/4/2566 BE.
//

import UIKit

final class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
    }

    func CustomTf() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.font = UIFont(name: Constants.ConstantFont.Regular, size: 14)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        CustomTf()
    }
    required public init?(coder tf: NSCoder) {
        super.init(coder: tf)
        CustomTf()
    }
}

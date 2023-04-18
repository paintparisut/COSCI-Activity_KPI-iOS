//
//  DisableSegueAnimated.swift
//  cosci-activity-kpi
//
//  Created by Nattapon Suwanno on 19/4/2566 BE.
//

import UIKit

class DisableSegueAnimated: UIStoryboardSegue {
    override func perform() {
        let source = source as UIViewController
        if let navigation = source.navigationController {
            navigation.pushViewController(destination as UIViewController, animated: false)
        }
    }
}

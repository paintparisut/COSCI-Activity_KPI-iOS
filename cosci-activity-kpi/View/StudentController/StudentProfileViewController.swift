//
//  StudentProfileViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func logoutButton(_ sender: Any) {
        AppUtils.eraseAllStudentData()
    }
    

}

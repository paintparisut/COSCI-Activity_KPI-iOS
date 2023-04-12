//
//  TeachProfileViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class TeachProfileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var roleTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuprofile()
    }
    

    @IBAction func logoutButton(_ sender: Any) {
        AppUtils.eraseAllTeacherData()
    }

    func setuprofile() {
        if let data = try? Data(contentsOf: URL(string: (Constants.URL_BASE+Constants.URL_IMG+AppUtils.getTeacherImg()!) ?? "")! ) {
            profileImg.image = UIImage(data: data)
        }
        nameTF.text = AppUtils.getTeacherName()
        userTF.text = AppUtils.getTeacherUserID()
        roleTF.text = AppUtils.getTeacherRole()
        emailTF.text = AppUtils.getTeacherEmail()
        telTF.text = AppUtils.getTeacherTel()
    }

}

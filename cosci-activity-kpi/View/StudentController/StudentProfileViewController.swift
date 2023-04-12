//
//  StudentProfileViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentProfileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var studentIdTF: UITextField!
    @IBOutlet weak var teacherTF: UITextField!
    @IBOutlet weak var majorTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setuprofile()
    }
    

    @IBAction func logoutButton(_ sender: Any) {
        AppUtils.eraseAllStudentData()
    }
    

    func setuprofile() {
        if let data = try? Data(contentsOf: URL(string: (Constants.URL_BASE+Constants.URL_IMG+AppUtils.getStudentImg()!) ?? "")! ) {
            profileImg.image = UIImage(data: data)
        }
        nameTF.text = AppUtils.getStudentName()
        userTF.text = AppUtils.getStudentUserID()
        studentIdTF.text = AppUtils.getStudentStudentID()
        teacherTF.text = AppUtils.getStudentTeacher()
        majorTF.text = AppUtils.getStudentMajor()
        emailTF.text = AppUtils.getStudentEmail()
        telTF.text = AppUtils.getStudentTel()
    }
}

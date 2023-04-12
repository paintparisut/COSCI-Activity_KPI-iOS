//
//  TeacherRegisterViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class TeacherRegisterViewController: UIViewController {

    @IBOutlet weak var useridTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var roleTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmpasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useridTF.text = AppUtils.getUploadedTeacherId()
        nameTF.text = AppUtils.getUploadedTeacherName()
        roleTF.text = AppUtils.getUploadedTeacherRole()
        emailTF.text = AppUtils.getUploadedTeacherEmail()
        telTF.text = AppUtils.getUploadedTeacherTel()
    }
    

    @IBAction func submitButton(_ sender: Any) {
        register()
    }
    
    @IBAction func cancleButton(_ sender: Any) {
        AppUtils.deleteUploadedTeacher()
        self.loginPage()
    }
    
    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteUploadedTeacher()
        self.dismiss(animated: false, completion: nil)

    }
    private func register() {
        var model = requestRegisterTeacherModel()
        model.user_id = useridTF.text
        model.name = nameTF.text
        model.role = roleTF.text
        model.email = emailTF.text
        model.tel = telTF.text
        model.password = passwordTF.text
        model.confirmpassword = confirmpasswordTF.text
        
        AuthViewModel().registerTeacher(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteUploadedTeacher()
                self.loginPage()
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    print(msg)
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                case .UnParsableError:
                    print("Error \(error)")
                case .NoNetworkError:
                    print("No network")
                }
            }
        }
    }

    func loginPage() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }
    
}

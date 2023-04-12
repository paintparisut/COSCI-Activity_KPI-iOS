//
//  StudentRegisterViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentRegisterViewController: UIViewController {

    @IBOutlet weak var studentidTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var majorTF: UITextField!
    @IBOutlet weak var teacherTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmpasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentidTF.text = AppUtils.getUploadedStudentId()
        nameTF.text = AppUtils.getUploadedStudentName()
        majorTF.text = AppUtils.getUploadedStudentMajor()
        teacherTF.text = AppUtils.getUploadedStudentTeacher()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        register()
    }
    
    @IBAction func cancleButton(_ sender: Any) {
        AppUtils.deleteUploadedStudent()
        self.loginPage()
    }
    

    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteUploadedStudent()
        self.dismiss(animated: false, completion: nil)

    }
    
    private func register() {
        var model = requestRegisterStudentModel()
        model.student_id = studentidTF.text
        model.name = nameTF.text
        model.major = majorTF.text
        model.teacher = teacherTF.text
        model.email = emailTF.text
        model.tel = telTF.text
        model.password = passwordTF.text
        model.confirmpassword = confirmpasswordTF.text
            
        print(model)
        
        AuthViewModel().registerStudent(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteUploadedStudent()
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

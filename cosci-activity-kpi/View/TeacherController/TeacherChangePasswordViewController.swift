//
//  TeacherForgotPasswordViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 13/4/2566 BE.
//

import UIKit

class TeacherChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldpassword: UITextField!
    @IBOutlet weak var newpassword: UITextField!
    @IBOutlet weak var confirmnewpassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func submitButton(_ sender: Any) {
        changepassword()
    }
    

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    private func changepassword() {
        var model = resquestChangeTeacherModel()
        model.oldpassword = oldpassword.text
        model.password = newpassword.text
        model.confirmpassword = confirmnewpassword.text
        print(model)
        
        TeacherViewModel().changePasswordTeacher(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                self.dismiss(animated: false, completion: nil)
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
    
}

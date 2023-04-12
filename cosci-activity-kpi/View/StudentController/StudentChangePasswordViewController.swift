//
//  StudentForgotPasswordViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 13/4/2566 BE.
//

import UIKit

class StudentChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldpassword: UITextField!
    @IBOutlet weak var newpassword: UITextField!
    @IBOutlet weak var newpasswordconfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        changepassword()
    }
    
    private func changepassword() {
        var model = resquestChangeStudentModel()
        model.oldpassword = oldpassword.text
        model.password = newpassword.text
        model.confirmpassword = newpasswordconfirm.text
        print(model)
        
        StudentViewModel().changePasswordStudent(reqObj: model) { result in
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

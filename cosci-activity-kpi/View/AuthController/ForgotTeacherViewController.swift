//
//  ForgotTeacherViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 6/4/2566 BE.
//

import UIKit

class ForgotTeacherViewController: UIViewController {

    @IBOutlet weak var useridTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Submit(_ sender: Any) {
        forgotPassword()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancleButton(_ sender: Any) {
        loginPage()
    }
    private func forgotPassword() {
        var model = resquestForgotTeacherModel()
        
        model.user_id = useridTF.text

        AuthViewModel().forgotPasswordTeacher(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
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
    
    private func loginPage() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }

}

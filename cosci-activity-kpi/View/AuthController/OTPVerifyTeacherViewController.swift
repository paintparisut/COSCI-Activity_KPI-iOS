//
//  OTPVerifyTeacherViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 6/4/2566 BE.
//

import UIKit

class OTPVerifyTeacherViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var OtpTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = AppUtils.getEmailOTP()
    }
    
    @IBAction func VerifyButton(_ sender: Any) {
        fetchVerify()
    }
    
    @IBAction func resendButton(_ sender: Any) {
        resendVerify()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteEmailOTP()
        self.dismiss(animated: false, completion: nil)
    }
    private func fetchVerify() {
        var model = requestOtpModel()
        model.email = emailTF.text
        model.otp = OtpTF.text
            
        AuthViewModel().verifyTeacher(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.saveTeacherImg(img: response.img_user ?? "")
                AppUtils.saveTeacherName(name: response.name ?? "")
                AppUtils.saveTeacherUserID(userID: response.user_id ?? "")
                AppUtils.saveTeacherRole(role: response.role ?? "")
                AppUtils.saveTeacherEmail(email: response.email ?? "")
                AppUtils.saveTeacherTel(tel: response.tel ?? "")
                AppUtils.deleteEmailOTP()
                self.teacherHome()
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
    
    private func resendVerify() {
        var model = requestResendOtpModel()
        model.email = emailTF.text
        print(model)
        
        AuthViewModel().resendOTPTeacher(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
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
    
    func teacherHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "teacher") as! UITabBarController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:false, completion:nil)
    }
    

}

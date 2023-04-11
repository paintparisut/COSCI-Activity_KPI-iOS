//
//  OTPVerifyViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class OTPVerifyStudentViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var OtpTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = AppUtils.getEmailOTP()
    }
    

    @IBAction func verifyButton(_ sender: Any) {
        fetchVerify()
    }
    
    @IBAction func resendButton(_ sender: Any) {
        resendVerify()
    }
    
    
    private func fetchVerify() {
        var model = requestOtpModel()
        model.email = emailTF.text
        model.otp = OtpTF.text
            
        AuthViewModel().verifyStudent(reqObj: model) { result in
            switch result {
            case .success(let response):
                AppUtils.saveStudentImg(img: response.img_user ?? "")
                AppUtils.saveStudentName(name: response.name ?? "")
                AppUtils.saveStudentUserID(userID: response.user_id ?? "")
                AppUtils.saveStudentStudentID(studentID: response.student_id ?? "")
                AppUtils.saveStudentTeacher(teacher: response.teacher ?? "")
                AppUtils.saveStudentMajor(major: response.major ?? "")
                AppUtils.saveStudentEmail(email: response.email ?? "")
                AppUtils.saveStudentTel(tel: response.tel ?? "")
                AppUtils.deleteEmailOTP()
                self.stundentHome()
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
        
        AuthViewModel().resendOTPStudent(reqObj: model) { result in
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
    

    func stundentHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "student") as! UITabBarController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }

}

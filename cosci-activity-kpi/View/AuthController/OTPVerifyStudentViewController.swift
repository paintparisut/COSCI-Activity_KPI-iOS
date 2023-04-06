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

    }
    

    @IBAction func verifyButton(_ sender: Any) {
        fetchVerify()
    }
    
    @IBAction func resendButton(_ sender: Any) {
        resendVerify()
    }
    
    
    private func fetchVerify() {
            var model = requestOtpModel()
            
            print(model)
            
            AuthViewModel().verifyStudent(reqObj: model) { result in
                switch result {
                case .success(let response):
                    print("Success",response)
//                    AppUtils.saveUsrProfile(profile: response.profile_pic ?? "")
//                    AppUtils.saveUsrUsername(username: response.username ?? "")
//                    AppUtils.saveUsrEmail(email: response.email ?? "")
//                    AppUtils.saveUsrName(firstname: response.name?.firstname ?? "", lastname: response.name?.lastname ?? "")
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
            
            print(model)
            
            AuthViewModel().resendOTPStudent(reqObj: model) { result in
                switch result {
                case .success(let response):
                    print("Success",response)
//                    AppUtils.saveUsrProfile(profile: response.profile_pic ?? "")
//                    AppUtils.saveUsrUsername(username: response.username ?? "")
//                    AppUtils.saveUsrEmail(email: response.email ?? "")
//                    AppUtils.saveUsrName(firstname: response.name?.firstname ?? "", lastname: response.name?.lastname ?? "")
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

//
//  LoginViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButton(_ sender: Any) {
        fetchLoginStudent()
    }
    

    private func fetchLoginStudent() {
        var model = requestLoginStudentModel()
//        model.user_id = usernameTF.text ?? ""
//        model.password = passwordTF.text ?? ""
//          model.username = username.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
//          model.password = password.trimmingCharacters(in: .whitespacesAndNewlines)
//          model.device_id = AppUtils.getDeviceUUIDToken()
                    
        AuthViewModel().loginStudent(reqObj: model) { result in
              switch result {
              case .success(let response):
                  print("Success",response)
//                  AppUtils.saveUsrEmail(email: response.email ?? "")
//                  AppUtils.saveUsrProfile(profile: response.profile_pic ?? "")
//                  AppUtils.saveUsrUsername(username: response.username ?? "")
//                  AppUtils.saveUsrName(firstname: response.name?.firstname ?? "", lastname:
                  
              case .failure(let error):
                  switch error{
                  case .BackEndError(let msg):
                      print(msg)
//                      isError = true
                  case .Non200StatusCodeError(let val):
                      print("Error Code: \(val.status) - \(val.message)")
                  case .UnParsableError:
                      print("Error \(error)")
                  case .NoNetworkError:
                      print("No Network")
                  }
              }
          }
      }
    
}

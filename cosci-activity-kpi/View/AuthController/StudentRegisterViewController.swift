//
//  StudentRegisterViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentRegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func submitButton(_ sender: Any) {
        register()
    }
    
    private func register() {
            var model = requestRegisterStudentModel()
            
            print(model)
            
            AuthViewModel().registerStudent(reqObj: model) { result in
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

}

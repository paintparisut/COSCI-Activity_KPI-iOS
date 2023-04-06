//
//  TacherUploadedViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 31/3/2566 BE.
//

import UIKit

class TacherUploadedViewController: UIViewController {

    @IBOutlet weak var teacherTF: UITextField!
    
    @IBAction func submitBT(_ sender: Any) {
        fetchUploaded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func fetchUploaded() {
            var model = requestTeacherUploadedModel()
            print(model)
            
            AuthViewModel().teacherUploaded(reqObj: model) { result in
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

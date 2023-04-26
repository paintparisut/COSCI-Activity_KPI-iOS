//
//  StudentUploadedViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentUploadedViewController: UIViewController {

    @IBOutlet weak var useridTF: CustomTextField!
    @IBOutlet weak var errorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        fetchStudentUploaded()
    }
    
    private func fetchStudentUploaded() {
        var model = requestStudentUploadedModel()
        model.user_id = useridTF.text
        AuthViewModel().studentUploaded(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.saveUploadedStudentName(name: response.name ?? "")
                AppUtils.saveUploadedStudentId(studentid: response.user_id ?? "")
                AppUtils.saveUploadedStudentMajor(major: response.major ?? "")
                AppUtils.saveUploadedStudentTeacher(teacher: response.teacher ?? "")
                self.registerView()
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    print(msg)
                    self.errorView.isHidden = false
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                    self.errorView.isHidden = false
                case .UnParsableError:
                    print("Error \(error)")
                    self.errorView.isHidden = false
                case .NoNetworkError:
                    print("No network")
                }
            }
        }
    }
    
    
    func registerView() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "studentregister") as! StudentRegisterViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }

}

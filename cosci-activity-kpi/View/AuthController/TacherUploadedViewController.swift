//
//  TacherUploadedViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 31/3/2566 BE.
//

import UIKit

class TacherUploadedViewController: UIViewController {

    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var teacherTF: UITextField!
    
    @IBAction func submitBT(_ sender: Any) {
        fetchUploaded()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorView.isHidden = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func fetchUploaded() {
        var model = requestTeacherUploadedModel()
        model.user_id = teacherTF.text
        AuthViewModel().teacherUploaded(reqObj: model) { result in
            switch result {
            case .success(let response):
                AppUtils.saveUploadedTeacherUserID(userid: response.user_id ?? "")
                AppUtils.saveUploadedTeacherName(name: response.name ?? "")
                AppUtils.saveUploadedTeacherRole(role: response.role ?? "")
                AppUtils.saveUploadedTeacherEmail(email: response.email ?? "")
                AppUtils.saveUploadedTeacherTel(tel: response.tel ?? "")
                self.registerView()
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    print(msg)
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                case .UnParsableError:
                    self.errorView.isHidden = false
                    print("Error \(error)")
                case .NoNetworkError:
                    print("No network")
                }
            }
        }
    }
    
    func registerView() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "teacherregister") as! TeacherRegisterViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2.2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

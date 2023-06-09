//
//  OTPVerifyTeacherViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 6/4/2566 BE.
//

import UIKit
import OTPFieldView

class OTPVerifyTeacherViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var otpFieldView: OTPFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = AppUtils.getEmailOTP()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        implementotpView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func implementotpView(){
        self.otpFieldView.otpInputType = .numeric
        self.otpFieldView.fieldsCount = 6
        self.otpFieldView.fieldBorderWidth = 1
        self.otpFieldView.defaultBorderColor = UIColor.systemGray6
        self.otpFieldView.displayType = .roundedCorner
        self.otpFieldView.fieldSize = 45
        self.otpFieldView.separatorSpace = 3
        self.otpFieldView.shouldAllowIntermediateEditing = false
        self.otpFieldView.secureEntry = false
        self.otpFieldView.initializeUI()
        self.otpFieldView.requireCursor = true
        self.otpFieldView.delegate = self
        self.otpFieldView.filledBackgroundColor = UIColor.systemGray6
    }
    
    @IBAction func VerifyButton(_ sender: Any) {

    }
    
    @IBAction func resendButton(_ sender: Any) {
        resendVerify()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteEmailOTP()
        self.dismiss(animated: false, completion: nil)
    }
    private func fetchVerify(otp:String) {
        var model = requestOtpModel()
        model.email = emailTF.text
        model.otp = otp
            
        AuthViewModel().verifyTeacher(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.saveTeacherID(id: response._id ?? "")
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
                    if msg.errorMessage == "otp code not the same" {
                        let alert = UIAlertController(title: "OTP ไม่ถูกต้อง", message: "กรอก OTP ผิดหรือ OTP หมดอายุ", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
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
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2.5
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}


extension OTPVerifyTeacherViewController: OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func getOTP(otp: String) -> String {
       return otp
    }
    
    func enteredOTP(otp: String) {
        fetchVerify(otp: otp)
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("--- \(hasEnteredAll)")
        return false
    }
}

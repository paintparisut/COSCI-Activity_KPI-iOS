//
//  OTPVerifyViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit
import OTPFieldView

class OTPVerifyStudentViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var OtpTF: UITextField!
    
    @IBOutlet weak var otpFieldView: OTPFieldView!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = AppUtils.getEmailOTP()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        implementotpView()
        
    }

    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteEmailOTP()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func verifyButton(_ sender: Any) {
        
    }
    
    @IBAction func resendButton(_ sender: Any) {
        resendVerify()
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
    
    
    private func fetchVerify(otp:String) {
        var model = requestOtpModel()
        model.email = emailTF.text
        model.otp = otp
            
        AuthViewModel().verifyStudent(reqObj: model) { result in
            switch result {
            case .success(let response):
                AppUtils.saveStudentID(id: response._id ?? "")
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

extension OTPVerifyStudentViewController: OTPFieldViewDelegate {
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

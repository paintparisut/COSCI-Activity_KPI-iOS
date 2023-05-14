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
    @IBOutlet weak var forgotPassword: CustomButton!
    @IBOutlet weak var selectRoleSegment: UISegmentedControl!
    @IBOutlet weak var loginLabel: CustomLable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.text = "co631010205"
        passwordTF.text = "123456789"
        let font = UIFont(name: ConstantsInterface.ConstantFont.Medium, size: 16)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font, .foregroundColor: UIColor.darkGray,], for: .normal)
        UISegmentedControl.appearance().layer.cornerRadius = 30
        AppUtils.eraseAllStudentData()
        AppUtils.eraseAllTeacherData()
        AppUtils.deleteReq()
        AppUtils.deleteEmailOTP()
        AppUtils.deleteEventStudent()
        AppUtils.deleteUploadedStudent()
        AppUtils.deleteUploadedTeacher()
        AppUtils.eraseImgList()
        loginSegment()
        keyboardPush()
    }
    
    @IBAction func segmentOnChange(_ sender: Any) {
        loginSegment()
    }
    
    func keyboardPush() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func loginSegment() {
        if selectRoleSegment.selectedSegmentIndex == 0 {
            self.loginLabel.text = "บัวศรีไอดี"
            usernameTF.text = ""
            passwordTF.text = ""
        }
        else {
            self.loginLabel.text = "ชื่อผู้ใช้งาน"
            usernameTF.text = ""
            passwordTF.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if selectRoleSegment.selectedSegmentIndex == 0 {            fetchLoginStudent()
        }
        else {
            fetchLoginTeacher()
        }
    }
    

    @IBAction func registerButton(_ sender: Any) {
    }
    
    private func fetchLoginStudent() {
        var model = requestLoginStudentModel()
        model.user_id = usernameTF.text ?? ""
        model.password = passwordTF.text ?? ""
        print(model)
        AuthViewModel().loginStudent(reqObj: model) { result in
              switch result {
              case .success(let response):
                  print("Success",response)
                  AppUtils.saveStudentID(id: response._id ?? "")
                  AppUtils.saveStudentImg(img: response.img_user ?? "")
                  AppUtils.saveStudentName(name: response.name ?? "")
                  AppUtils.saveStudentUserID(userID: response.user_id ?? "")
                  AppUtils.saveStudentStudentID(studentID: response.student_id ?? "")
                  AppUtils.saveStudentTeacher(teacher: response.teacher ?? "")
                  AppUtils.saveStudentMajor(major: response.major ?? "")
                  AppUtils.saveStudentEmail(email: response.email ?? "")
                  AppUtils.saveStudentTel(tel: response.tel ?? "")
                  self.stundentHome()
              case .failure(let error):
                  switch error{
                  case .BackEndError(let msg):
                      if msg.errorMessage == "nOK" { // case invalid
                          let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message: "ไม่มีผู้ใช้ หรือกรอกข้อมูลผิด", preferredStyle: UIAlertController.Style.alert)
                          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                          self.present(alert, animated: true, completion: nil)
                      }
                      else if msg.errorMessage == "Wait" { // case otp
                          print(msg.data)
                          AppUtils.saveEmailOTP(email: msg.data)
                          self.verifystudent()
                      }
                      else {
                          print("error")
                      }
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
    
    private func fetchLoginTeacher() {
        var model = requestLoginTeacherModel()
        model.user_id = usernameTF.text ?? ""
        model.password = passwordTF.text ?? ""
        print("teacher")

        AuthViewModel().loginTeacher(reqObj: model) { result in
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
                  self.teacherHome()
              case .failure(let error):
                  switch error{
                  case .BackEndError(let msg):
                      if msg.errorMessage == "nOK" { // case invalid
                          print(msg)
                          let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message: "ไม่มีผู้ใช้ หรือกรอกข้อมูลผิด", preferredStyle: UIAlertController.Style.alert)
                          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                          self.present(alert, animated: true, completion: nil)
                      }
                      else if msg.errorMessage == "Wait" { // case otp
                          print(msg.data)
                          AppUtils.saveEmailOTP(email: msg.data)
                          self.verifyteacher()
                      }
                      else {
                          print("error")
                      }
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
    
    func stundentHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "student") as! UITabBarController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    func teacherHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "teacher") as! UITabBarController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    func verifystudent() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "verifystudent") as! OTPVerifyStudentViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }
    
    func verifyteacher() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "verifyteacher") as! OTPVerifyTeacherViewController
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

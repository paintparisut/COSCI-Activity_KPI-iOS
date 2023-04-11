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
    @IBOutlet weak var selectRoleSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButton(_ sender: Any) {
        if selectRoleSegment.selectedSegmentIndex == 0 {
            fetchLoginStudent()
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
                          print(msg)
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
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func teacherHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "teacher") as! UITabBarController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func verifystudent() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "verifystudent") as! OTPVerifyStudentViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:true, completion:nil)
    }
    
    func verifyteacher() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "verifyteacher") as! OTPVerifyTeacherViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:true, completion:nil)
    }
}

//
//  StudentSentRequestViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 17/4/2566 BE.
//

import UIKit

class StudentSentRequestViewController: UIViewController{

    var imagePicker = UIImagePickerController()
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        AppUtils.getImgList() //ลิสรูปภาพที่ใช้โชว์
    }

    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteEventStudent()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func uploadImgButton(_ sender: Any) {
        uploadimagePage()
    }

    
    @IBAction func submitButton(_ sender: Any) {
        if AppUtils.getStudentID() != nil {
            if AppUtils.getImgList() != nil {
                sentReqStudent()
            }
            else {
                let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message:"กรุณาอัพโหลดรูปภาพหรือเลือกรูปภาพ", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else {
            if AppUtils.getImgList() != nil {
                sentReqTeacher()
            }
            else {
                let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message:"กรุณาอัพโหลดรูปภาพหรือเลือกรูปภาพ", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
   
    private func sentReqStudent() {

        var model = reqDataModel()
        
        model.id_event = AppUtils.getStudentEventID()
        model.start_date = AppUtils.getStudentEventStart()
        model.end_date = AppUtils.getStudentEventEnd()
        model.uploaded_img = AppUtils.getImgList()
        model.uploaded_pdf = "mockup.pdf"
        model.status_request = "ส่งเรื่องแล้ว"
        model.type_request = AppUtils.getStudentEventType()

        print(model)
        StudentViewModel().sendReqStudent(reqObj: model){ result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteEventStudent()
                self.dismiss(animated: false, completion: nil)
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
    
    private func sentReqTeacher() {
        
        var model = requestCreateReqTeacherDataModel()
        
        model.id_event = AppUtils.getStudentEventID()
        model.start_date = AppUtils.getStudentEventStart()
        model.end_date = AppUtils.getStudentEventEnd()
        model.uploaded_img = AppUtils.getImgList()
        model.uploaded_pdf = "mockup.pdf"
        model.status_request = "สำเร็จ"
        model.type_request = AppUtils.getStudentEventType()
        
        TeacherViewModel().sendReqTeacher(reqObj: model){ result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteEventStudent()
                self.dismiss(animated: false, completion: nil)
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
    
    func uploadimagePage() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "uploadimage") as! UploadedImageViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }
    
}

//
//  StudentSentRequestViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 17/4/2566 BE.
//

import UIKit
import PhotosUI

class StudentSentRequestViewController: UIViewController, PHPickerViewControllerDelegate {

    var imagePicker = UIImagePickerController()
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func uploadImgButton(_ sender: Any) {
//        showPicker()
        showPicker()
    }

    private func showPicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0 // Selection limit. Set to 0 for unlimited.
        configuration.filter = .images // he types of media that can be get.
        // configuration.filter = .any([.videos,livePhotos]) // Multiple types of media
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) // dismiss a picker
        
        let imageItems = results
            .map { $0.itemProvider }
            .filter { $0.canLoadObject(ofClass: UIImage.self) } // filter for possible UIImages
        
        let dispatchGroup = DispatchGroup()
        var images = [UIImage]()
        
        for imageItem in imageItems {
            dispatchGroup.enter() // signal IN
            
            imageItem.loadObject(ofClass: UIImage.self) { image, _ in
                if let image = image as? UIImage {
                    images.append(image)
                }
                dispatchGroup.leave() // signal OUT
            }
        }
        
        // This is called at the end; after all signals are matched (IN/OUT)
        dispatchGroup.notify(queue: .main) {
            print(images)
            // DO whatever you want with `images` array
        }
    }
    
    private func uploadimg() {
        var model = requestRegisterTeacherModel()
        FileViewModel().uploadPhoto(with: data!, fileName: "") { result in
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
    
    private func sentReqStudent() {

        var model = reqDataModel()
        
        model.id_event = AppUtils.getStudentEventID()
        model.start_date = AppUtils.getStudentEventStart()
        model.end_date = AppUtils.getStudentEventEnd()
        model.uploaded_img = [] // set array img
        model.uploaded_pdf = ""
        model.status_request = "ส่งเรื่องแล้ว"
        model.type_request = AppUtils.getStudentEventType()
        
        StudentViewModel().sendReqStudent(reqObj: model){ result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteEventStudent()
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
        model.uploaded_img = [] // set array img
        model.uploaded_pdf = ""
        model.status_request = "สำเร็จ"
        model.type_request = AppUtils.getStudentEventType()
        
        TeacherViewModel().sendReqTeacher(reqObj: model){ result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteEventStudent()
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

//
//  UploadedImageViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 13/5/2566 BE.
//

import UIKit
import PhotosUI

class UploadedImageViewController: UIViewController, PHPickerViewControllerDelegate{

    var data = [UIImage]() //แสดงรูปอัพโหลด
    var imgselected = [String]() // ใส่รูปทีเลือกแล้ว เก็บรูปที่เลือก
    var selectimage = AppUtils.getStudentEventImgList()//show selectรูปภาพ

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func UploadImageButton(_ sender: Any) {
        showPicker()
    }
  

    @IBAction func submitButton(_ sender: Any) {
        if imgselected == [] && data == [] {
            let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message:"โปรดอัพโหลดรูปภาพหรือเลือกรูปภาพกิจกรรม", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            uploadimg()
            self.dismiss(animated: false, completion: nil)
        }
        
    }
    
    //config picker
    private func showPicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0 // Selection limit. Set to 0 for unlimited.
        configuration.filter = .images // he types of media that can be get.
//         configuration.filter = .any([.videos,livePhotos]) // Multiple types of media
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }

    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
           picker.dismiss(animated: true, completion: nil)
           
        var imagelist = [UIImage]()

           for result in results {
               result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                   if let image = object as? UIImage {
                       imagelist.append(image)
                       // (e.g., add it to an array, display it, etc.)
                       print(imagelist.count)
                       self.data = imagelist
                       DispatchQueue.main.async {
                           // Process the image on the main queue
                           // (e.g., update UI, add it to an array, etc.)
                       }
                   }
               }
           }
       }
    
    private func uploadimg() {
        FileViewModel().uploadPhoto(with: data ) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.saveImgList(img: response+self.imgselected)
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    print(msg)
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                case .UnParsableError:
                    let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message:"ไม่สามารถอัพโหลดรูปภาพได้ในขณะนี้ โปรดลองใหม่อีกครั้ง", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                case .NoNetworkError:
                    let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message:"โปรดตรวจสอบอินเตอร์เน็ต", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
}

//
//  StudentSentRequestViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 17/4/2566 BE.
//

import UIKit

class StudentSentRequestViewController: UIViewController{

    @IBOutlet weak var EmptyUploadImage: UIView!
    var imagePicker = UIImagePickerController()
    var data: Data?
    var imageUploadSelected = AppUtils.getImgList()
    @IBOutlet weak var StudentName: CustomTextField!
    @IBOutlet weak var StudentId: CustomTextField!
    @IBOutlet weak var EventCatagories: UILabel!
    @IBOutlet weak var EventTimeRecive: UILabel!
    @IBOutlet weak var EventImage: UIImageView!
    @IBOutlet weak var EventTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.EventTimeRecive.text = "\(AppUtils.getStudentEventHour() ?? 0) ชั่วโมง"
        self.EventTitle.text = AppUtils.getStudentEventName()
        self.EventImage.image = UIImage(url: URL(string: Constants.URL_BASE+"/"+(AppUtils.getStudentEventImg() ?? "public/img/imgactivity.png")))
        self.EventCatagories.text = AppUtils.getStudentEventType()
        self.StudentName.text = AppUtils.getStudentName()
        self.StudentId.text = AppUtils.getStudentStudentID()
        print("dfgjikojifgodjiodfg \(imageUploadSelected?.count)")
        showEmpty()
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.imageUploadSelected = AppUtils.getImgList()
//        print("--------------------- \(AppUtils.getImgList())")
//
//    }
    override func viewDidAppear(_ animated: Bool) {
        showEmpty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageUploadSelected = AppUtils.getImgList()
        print("--------------------- \(imageUploadSelected)")
        showEmpty()
        collectionView.reloadData()
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func showEmpty() {
        if imageUploadSelected?.count == nil {
            EmptyUploadImage.isHidden = false
        } else {
            EmptyUploadImage.isHidden = true
        }
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



extension StudentSentRequestViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUploadSelected?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageUploadSuccessCell", for: indexPath) as? ImageUploadSuccessCell else {
            return UICollectionViewCell()
        }
        cell.ImageUploadSuccessShow.image = UIImage(url: URL(string: Constants.URL_BASE+"/"+(imageUploadSelected?[indexPath.row] ?? "")))
        return cell
    }
}


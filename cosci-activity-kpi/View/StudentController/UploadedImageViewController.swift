//
//  UploadedImageViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 13/5/2566 BE.
//

import UIKit
import PhotosUI

class UploadedImageViewController: UIViewController, PHPickerViewControllerDelegate{

    @IBOutlet weak var ImageListCollection: UICollectionView!
    @IBOutlet weak var ImageCollection: UICollectionView!
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var EmptyImageUploadList: UIView!
    @IBOutlet weak var EmptyUploadView: UIView!
    var data = [UIImage]() //แสดงรูปอัพโหลด
    var imgselected = [String]() // ใส่รูปทีเลือกแล้ว เก็บรูปที่เลือก
    var selectimage = AppUtils.getStudentEventImgList()//show selectรูปภาพ
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showEmpty()
        ImageCollection!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        ImageListCollection!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func showEmpty() {
        if data.count == 0 {
            EmptyUploadView.isHidden = false
        } else {
            EmptyUploadView.isHidden = true
        }
        
        if selectimage?.count == 0 {
            EmptyImageUploadList.isHidden = false
        } else {
            EmptyImageUploadList.isHidden = true
        }
    }
    
    @IBAction func UploadImageButton(_ sender: Any) {
        showPicker()
    }
  

    @IBAction func submitButton(_ sender: Any) {
        Task { @MainActor in
            if imgselected == [] && data == [] {
                let alert = UIAlertController(title: "เกิดข้อผิดพลาด", message:"โปรดอัพโหลดรูปภาพหรือเลือกรูปภาพกิจกรรม", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                try await uploadimg()
                
            }
            
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
                       self.data = imagelist
                       DispatchQueue.main.async {
                           self.ImageCollection.reloadData()
                           self.showEmpty()
                       }
                   }
               }
           }
       }
    
    private func uploadimg() {
        FileViewModel().uploadPhoto(with: data ) { result in
            switch result {
            case .success(let response):
                print("Success ->",response)
                AppUtils.saveImgList(img: response+self.imgselected)
                self.dismiss(animated: false, completion: nil)
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


extension UploadedImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ImageCollection {
            return data.count
        } else if collectionView == self.ImageListCollection {
            return selectimage?.count ?? 0
        }
        return 0
    }
    
    @objc func handleImageTap(_ sender: UITapGestureRecognizer) {
             guard let tappedImageView = sender.view as? UIImageView else {
                 return
             }
             
             if let tappedImage = tappedImageView.image {
                 if data.contains(tappedImage) {
                     if let index = data.firstIndex(of: tappedImage) {
                         data.remove(at: index)
                         self.ImageCollection.reloadData()
                     }
                 } else {
                     data.append(tappedImage)
                     self.ImageCollection.reloadData()
                 }
                 self.showEmpty()
             }
         }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if collectionView == self.ImageCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
                return UICollectionViewCell()
            }
            cell.ImageShow.image = data[indexPath.row]
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap(_:)))
               cell.ImageShow.addGestureRecognizer(tapGesture)
               cell.ImageShow.isUserInteractionEnabled = true
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageUploadListCell", for: indexPath) as? ImageUploadListCell else {
                return UICollectionViewCell()
            }
            cell.ImageUploadListShow.image = UIImage(url: URL(string: Constants.URL_BASE+"/"+(selectimage?[indexPath.row] ?? "")))
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap(_:)))
               cell.ImageUploadListShow.addGestureRecognizer(tapGesture)
               cell.ImageUploadListShow.isUserInteractionEnabled = true
            return cell
        }
    }
    
}

extension UploadedImageViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.ImageCollection {
            return CGSize(width: collectionView.frame.size.width / 2.3, height: collectionView.frame.size.height / 1.5)
        }
        return CGSize(width: 300, height: 200)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0    }
}

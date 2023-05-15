//
//  StudentHistoryDetailViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 17/4/2566 BE.
//

import UIKit

class StudentHistoryDetailViewController: UIViewController {

    @IBOutlet weak var reqEventNameLB: UILabel!
    @IBOutlet weak var reqEventImg: UIImageView!
    @IBOutlet weak var reqEventStudentnameLB: UILabel!
    @IBOutlet weak var reqEventTypeLB: UILabel!
    @IBOutlet weak var reqEventHourLB: UILabel!
    @IBOutlet weak var reqEventTimeLB: UILabel!
    @IBOutlet weak var reqEventStatusLB: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reqEventNameLB.text =  AppUtils.getReqEventName()
        reqEventStudentnameLB.text = "ผู้ยื่นตำร้อง: \(AppUtils.getStudentName() ?? AppUtils.getTeacherName()!)"
        reqEventStatusLB.text = "สถานะ: \(AppUtils.getReqEventStatusReq()!)"
        reqEventTypeLB.text = AppUtils.getReqEventType()!
        reqEventHourLB.text = "ได้รับ: \(AppUtils.getReqEventHour()!) ชั่วโมง"
        reqEventTimeLB.text = "วันที่เข้าร่วมกิจกรรม: \(formatDate(date: AppUtils.getReqEventTime()! ?? ""))"
        reqEventImg.image = UIImage(url: URL(string: Constants.URL_BASE+"/"+(AppUtils.getReqEventImg() ?? "public/img/imgactivity.png")))
    }
    

    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteReq()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "ลบคำร้อง", message: "ต้องการลบคำร้องใช่หรือไม่", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "ใช่", style: .default, handler: { (action: UIAlertAction!) in
            self.deleteReq()
            AppUtils.deleteReq()
            self.dismiss(animated: false, completion: nil)
        }))

        refreshAlert.addAction(UIAlertAction(title: "ยกเลิก", style: .cancel, handler: { (action: UIAlertAction!) in
        }))

        present(refreshAlert, animated: true, completion: nil)
        
    }
    
    public func formatDate(date:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = dateFormat().stringToDate(date: date ?? "")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

    private func deleteReq() {
        var model = resquestDeleteReq()
        model._id = AppUtils.getReqEventID()
 
        print(model)
        StudentViewModel().deleteReq(reqObj: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.deleteReq()
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


extension StudentHistoryDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppUtils.getReqEventImgUpload()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryDetailViewCell", for: indexPath) as? HistoryDetailViewCell else {
            return UICollectionViewCell()
        }
        cell.ImageShow.image = UIImage(url: URL(string: Constants.URL_BASE+"/"+(AppUtils.getReqEventImgUpload()?[indexPath.row] ?? "")))
        return cell
    }
}


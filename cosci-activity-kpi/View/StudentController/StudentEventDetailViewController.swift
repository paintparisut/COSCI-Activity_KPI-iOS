//
//  StudentEventDetailViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 17/4/2566 BE.
//

import UIKit

class StudentEventDetailViewController: UIViewController {

    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventNameLB: UILabel!
    @IBOutlet weak var eventDetailLB: UILabel!
    @IBOutlet weak var eventTypeLB: UILabel!
    @IBOutlet weak var eventActivityHourLB: UILabel!
    @IBOutlet weak var eventStartDateLB: UILabel!
    @IBOutlet weak var eventEndDateLB: UILabel!
    @IBOutlet weak var eventPostedTimeLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventImg.image = UIImage(url: URL(string: Constants.URL_BASE+(AppUtils.getStudentEventImg() ?? "public/img/imgactivity.png")))
        eventNameLB.text = AppUtils.getStudentEventName()
        eventDetailLB.text = AppUtils.getStudentEventDetail()
        eventTypeLB.text = "ประเภทกิจกรรม \(AppUtils.getStudentEventType() ?? "")"
        eventActivityHourLB.text = "ชั่วโมงกิจกรรม : \(AppUtils.getStudentEventHour() ?? 0) ชั่วโมง"
        eventStartDateLB.text = "วันที่เริ่ม : \(formatDate(date: AppUtils.getStudentEventStart() ?? ""))"
        eventEndDateLB.text = "วันสิ้นสุด : \(formatDate(date: AppUtils.getStudentEventEnd() ?? ""))"
        eventPostedTimeLB.text = "โพสเมื่อ\(formatDate(date: AppUtils.getStudentEventTimeStamp() ?? ""))"
        
//        AppUtils.getStudentEventImgList() //get img list ทำรูปกิจกรรมเพิ่ม
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteEventStudent()
        self.dismiss(animated: false, completion: nil)
    }
    
   
    @IBAction func submitButton(_ sender: Any) {
        sentReqPage()
    }
    
    func sentReqPage() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "studentrequest") as! StudentSentRequestViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }
    
    public func formatDate(date:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = dateFormat().stringToDate(date: date ?? "")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

}

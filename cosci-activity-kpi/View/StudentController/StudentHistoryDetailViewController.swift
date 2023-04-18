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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reqEventNameLB.text =  AppUtils.getReqEventName()
        reqEventStudentnameLB.text = AppUtils.getStudentName() ?? AppUtils.getTeacherName()
        reqEventStatusLB.text = AppUtils.getReqEventStatusReq()
        reqEventTypeLB.text = AppUtils.getReqEventType()
        reqEventHourLB.text = AppUtils.getReqEventHour()
        reqEventTimeLB.text = AppUtils.getReqEventTime()
        reqEventImg.image = UIImage(url: URL(string: Constants.URL_BASE+(AppUtils.getReqEventImg() ?? "public/img/imgactivity.png")))
    }
    

    @IBAction func backButton(_ sender: Any) {
        AppUtils.deleteReq()
        self.dismiss(animated: false, completion: nil)
    }
    
    public func formatDate(date:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = dateFormat().stringToDate(date: date ?? "")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

}

//
//  TeacherKPIListViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class TeacherKPIListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var eventlist : [eventDataModel] = []
    @IBOutlet weak var tableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getKpiData()
        tableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "eventcell")
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.attributedTitle = NSAttributedString(string:"เลื่อนลงเพื่อโหลดข้อมูลกิจกรรม")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getKpiData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventlist.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell", for: indexPath) as! EventTableViewCell
        cell.setEventcell(imgurl: eventlist[indexPath.row].event_img ?? "", name:  eventlist[indexPath.row].name_event ?? "", time:  eventlist[indexPath.row].posted_timestamp ?? "", type:  eventlist[indexPath.row].event_type ?? "")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ontap(gesture:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func ontap(gesture:UITapGestureRecognizer) {
           if let cell = gesture.view {
               print(cell.tag)
               AppUtils.saveStudentEventID(id: eventlist[cell.tag]._id ?? "")
               AppUtils.saveStudentEventName(name: eventlist[cell.tag].name_event ?? "")
               AppUtils.saveStudentEventImg(img: eventlist[cell.tag].event_img ?? "")
               AppUtils.saveStudentEventDetail(detail: eventlist[cell.tag].detail_event ?? "")
               AppUtils.saveStudentEventType(type: eventlist[cell.tag].event_type ?? "")
               AppUtils.saveStudentEventHour(hour: eventlist[cell.tag].activity_hour ?? 0)
               AppUtils.saveStudentEventStart(time: eventlist[cell.tag].start_date ?? "")
               AppUtils.saveStudentEventEnd(time: eventlist[cell.tag].end_date ?? "")
               AppUtils.saveStudentEventImglist(imgList: eventlist[cell.tag].event_img_list ?? [])
               AppUtils.saveStudentEventTimeStamp(time: eventlist[cell.tag].posted_timestamp ?? "")
               detailEventPage()
           }
       }
    
    
    private func getKpiData() {

            
        TeacherViewModel().getKpiData() { result in
            switch result {
            case .success(let response):
                print("Success",response)
                self.eventlist = response.data
                self.tableView.reloadData()
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

    func detailEventPage() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "eventdetail") as! StudentEventDetailViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }
    
    private func pullrefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
          refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }

    @objc func refresh(_ sender: AnyObject) {
        getKpiData()
        refreshControl.endRefreshing()
    }
    

}

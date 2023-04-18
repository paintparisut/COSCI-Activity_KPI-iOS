//
//  TeacherHistoryViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class TeacherHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let refreshControl = UIRefreshControl()
    var data:[requestReqTeacherDataModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryData()
        tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "historycell")
        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.attributedTitle = NSAttributedString(string:"เลื่อนลงเพื่อโหลดข้อมูลกิจกรรม")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getHistoryData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historycell", for: indexPath) as! HistoryTableViewCell
        cell.setHistoryCell(name: data[indexPath.row].name_event ?? "", type: data[indexPath.row].event_type ?? "", status: data[indexPath.row].status_request ?? "", time: data[indexPath.row].date_request ?? "")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ontap(gesture:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    @objc func ontap(gesture:UITapGestureRecognizer) {
           if let cell = gesture.view {
               print(cell.tag)
               AppUtils.saveReqEventName(name: data[cell.tag].name_event ?? "")
               AppUtils.saveReqEventImg(img: data[cell.tag].event_img ?? "")
               AppUtils.saveReqEventHour(hour: data[cell.tag].activity_hour ?? "")
               AppUtils.saveReqEventStatusReq(name: data[cell.tag].status_request ?? "")
               AppUtils.saveReqEventTime(time: data[cell.tag].date_request ?? "")
               AppUtils.saveReqEventType(type: data[cell.tag].event_type ?? "")
               
               detailReqPage()
           }
       }
    
    private func getHistoryData() {

        TeacherViewModel().getHistoryData() { result in
            switch result {
            case .success(let response):
                print("Success",response)
                self.data = response.data
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

    private func pullrefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
          refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    }

    @objc func refresh(_ sender: AnyObject) {
        getHistoryData()
        refreshControl.endRefreshing()
    }
    
    func detailReqPage() {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "reqdetail") as! StudentHistoryDetailViewController
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated:false, completion:nil)
    }

}





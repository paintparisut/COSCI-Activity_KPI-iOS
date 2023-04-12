//
//  StudentEventListViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentEventListViewController: UIViewController {
    
    let refreshControl = UIRefreshControl() // ทำpull refreshด้วย
    var data = eventModel(data: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEventData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    private func getEventData() {

            
        StudentViewModel().getEventData() { result in
            switch result {
            case .success(let response):
                print("Success",response)
                self.data = response
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
        getEventData()
        refreshControl.endRefreshing()
        
    }
}

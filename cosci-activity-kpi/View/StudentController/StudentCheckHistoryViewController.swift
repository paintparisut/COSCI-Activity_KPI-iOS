//
//  StudentCheckHistoryViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class StudentCheckHistoryViewController: UIViewController {

    let refreshControl = UIRefreshControl() // ทำpull refreshด้วย
    var data = [requestDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getHistoryData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getHistoryData()
    }
    
    private func getHistoryData() {
            
        StudentViewModel().getHistoryData() { result in
            switch result {
            case .success(let response):
                print("Success",response)
                self.data = response.data
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

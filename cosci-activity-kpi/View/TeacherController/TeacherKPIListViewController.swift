//
//  TeacherKPIListViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 4/4/2566 BE.
//

import UIKit

class TeacherKPIListViewController: UIViewController {

    var data = eventModel(data: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getKpiData()
    }
    
    private func getKpiData() {

            
        TeacherViewModel().getKpiData() { result in
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


}

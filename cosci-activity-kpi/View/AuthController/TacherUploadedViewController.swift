//
//  TacherUploadedViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 31/3/2566 BE.
//

import UIKit

class TacherUploadedViewController: UIViewController {

    @IBOutlet weak var teacherTF: UITextField!
    
    @IBAction func submitBT(_ sender: Any) {
        fetchRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func fetchRegister() {
        
        AuthViewModel().registerUser(userId: teacherTF.text ?? "",then: { [weak self] (result) in
            DispatchQueue.main.async { [weak self] in
            switch result {
            case .success(let response):
                print("Success",response)
                print(response)
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    print(msg)
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                case .UnParsableError:
                    print("Error \(error)")
                case .NoNetworkError:
                    print("no network")
                }
            }
        }
    })
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

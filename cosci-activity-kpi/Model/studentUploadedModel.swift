//
//  studentUploadedModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation


struct dataStudentUploadedModel : Codable {
    let user_id : String?
    let name : String?
    let major : String?
    let teacher : String?
    let register_check: Bool?
}



struct requestStudentUploadedModel: Codable {
    var user_id: String = "63130010046"
}

struct responseStudentUploadedModel: Codable {
    let result: String
    let message: String
    let data: dataStudentUploadedModel
}


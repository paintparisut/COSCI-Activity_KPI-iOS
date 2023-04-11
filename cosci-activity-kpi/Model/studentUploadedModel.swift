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

struct responseStudentUploadRegisModel : Codable {
    let result: String
    let message: String
    let data: dataStudentUploadedModel
}



struct requestStudentUploadedModel: Encodable {
    var user_id: String?
}

struct responseStudentUploadedModel: Codable {
    let result: String
    let message: String
    let data: resstu
}

struct resstu : Codable {
    let data : dataStudentUploadedModel
}

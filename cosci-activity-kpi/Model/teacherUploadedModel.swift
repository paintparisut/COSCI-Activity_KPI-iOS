//
//  teacherUploadedModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct dataTeacherUploadedModel : Codable {
    
    let user_id : String?
    let name : String?
    let role : String?
    let email : String?
    let gswu : String?
    let tel : String?
    let register_check:Bool?
    
}

struct requestTeacherUploadedModel : Codable {
    let user_id : String? = "sittichaiza"
}

struct responseTeacherUploadedModel: Codable {
    let result: String
    let message: String
    let data: dataTeacherUploadedModel
}



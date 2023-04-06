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
    let tel : String?
    let register_check:Bool?
}

struct requestTeacherUploadedModel : Codable {
    var user_id : String?
}

struct responseTeacherUploadedModel: Codable {
    let result: String
    let message: String
    let data: resteach
}

struct resteach : Codable {
    let data : dataTeacherUploadedModel
}



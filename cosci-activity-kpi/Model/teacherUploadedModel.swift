//
//  teacherUploadedModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct teacherUploadedModel : Codable {
    
    let user_id : String?
    let name : String?
    let role : String?
    let email : String?
    let gswu : String?
    let tel : String?
    let register_check:Bool?
    
}

struct reqteacherverify : Codable {
    let user_id : String?
}

struct responseteacherUploadedModel: Codable {
    let result: String
    let message: String
    let data: teacherUploadedModel
}

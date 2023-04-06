//
//  teacherRegisteredModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct requestLoginTeacherModel : Codable  {
    var user_id : String?
    var password : String?
}

struct dataLoginTeacherModel : Codable {
    
    let user_id : String?
    let name : String?
    let password : String?
    let role : String?
    let email : String?
    let tel : String?
    let img_user : String?
    
}

struct responseLoginTeacherModel: Codable {
    let result: String
    let message: String
    let data: dataLoginTeacherModel
}

struct resquestForgotTeacherModel: Codable {
    let user_id: String? = "co631010206"
}

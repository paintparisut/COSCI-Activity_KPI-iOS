//
//  studentRegisteredModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct requestLoginStudentModel : Codable  {
    var user_id : String?
    var password : String?
}

struct dataLoginStudentModel : Codable {
    let _id : String?
    let user_id : String?
    let name : String?
    let student_id : String?
    let teacher : String?
    let major : String?
    let email : String?
    let tel : String?
    let img_user : String?
}


struct responseLoginStudentModel: Codable {
    let result: String
    let message: String
    let data: dataLoginStudentModel
}

struct resquestForgotStudentModel: Codable {
    let user_id: String? = "co631010206"
}


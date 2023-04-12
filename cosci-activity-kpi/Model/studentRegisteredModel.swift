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
    var user_id: String?
}

struct requestRegisterStudentModel : Encodable {
    var name: String?
    var password: String?
    var confirmpassword: String?
    var student_id: String?
    var teacher: String?
    var major: String?
    var email: String?
    var tel: String? 
}


struct dataChangeStudentModel : Codable {
    let _id : String?
    let user_id : String?
    let name : String?
    let password : String?
    let student_id : String?
    let teacher : String?
    let major : String?
    let email : String?
    let tel : String?
    let img_user : String?
}


struct responseChangeStudentModel: Codable {
    let result: String
    let message: String
    let data: dataChangeStudentModel
}

struct resquestChangeStudentModel: Codable {
    var oldpassword: String?
    var password: String?
    var confirmpassword: String?
}


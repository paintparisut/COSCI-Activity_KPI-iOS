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

struct requestRegisterTeacherModel : Codable  {
    var user_id: String?
    var name: String?
    var password: String?
    var confirmpassword: String?
    var role: String?
    var email: String?
    var tel: String?
}

struct dataLoginTeacherModel : Codable {
    let _id : String?
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
    var user_id: String? 
}

struct resquestChangeTeacherModel: Codable {
    var oldpassword: String?
    var password: String?
    var confirmpassword: String?
}

//
//  requestModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct requestDataModel : Codable {
    let _id : String?
    let id_user : String?
    let user_id : String?
    let name : String?
    let student_id : String?
    let id_event : String?
    let name_event :String?
    let event_img : String?
    let event_type : String?
    let activity_hour : String?
    let start_date : String?
    let end_date : String?
    let uploaded_img : [String]?
    let uploaded_pdf : String?
    let date_request : String?
    let status_request : String?
    let type_request : String?
    let permissions_request : String?
}


struct reqDataModel : Codable {
    var id_event : String?
    var start_date : String?
    var end_date : String?
    var uploaded_img : [String]?
    var uploaded_pdf : String?
    var status_request : String?
    var type_request : String?
}

struct resDataModel : Codable {
    var _id : String?
    var id_user : String?
    var user_id : String?
    var name : String?
    var student_id : String?
    var id_event : String?
    var name_event :String?
    var event_img : String?
    var event_type : String?
    var activity_hour : String?
    var start_date : String?
    var end_date : String?
    var uploaded_img : [String]?
    var uploaded_pdf : String?
    var date_request : String?
    var status_request : String?
    var type_request : String?
    var permissions_request : String?
}



struct ResponseCreateRequestDataModel: Codable {
    var result: String
    var message: String
    var data: resDataModel
}


struct ResponseRequestDataModel: Codable {
    var result: String
    var message: String
    var data: requestModel
}

struct requestModel : Codable {
    var data : [requestDataModel]
}


struct requestReqTeacherDataModel : Codable {
    var _id : String?
    var id_user : String?
    var user_id : String?
    var name : String?
    var id_event : String?
    var name_event :String?
    var event_img : String?
    var event_type : String?
    var activity_hour : String?
    var start_date : String?
    var end_date : String?
    var uploaded_img : [String]?
    var uploaded_pdf : String?
    var date_request : String?
    var status_request : String?
    var type_request : String?
    var permissions_request : String?
}

struct requestCreateReqTeacherDataModel : Codable {
    var id_event : String?
    var start_date : String?
    var end_date : String?
    var uploaded_img : [String]?
    var uploaded_pdf : String?
    var status_request : String?
    var type_request : String?
}

struct resCreateReqTeacherDataModel : Codable {
    let _id : String?
    let id_user : String?
    let user_id : String?
    let name : String?
    let id_event : String?
    let name_event :String?
    let event_img : String?
    let event_type : String?
    let activity_hour : String?
    let start_date : String?
    let end_date : String?
    let uploaded_img : [String]?
    let uploaded_pdf : String?
    let date_request : String?
    let status_request : String?
    let type_request : String?
    let permissions_request : String?
    
}

struct ResponseRequestTeacherModel: Codable {
    var result: String
    var message: String
    var data: resCreateReqTeacherDataModel
}


struct ResponseRequestTeacherDataModel: Codable {
    var result: String
    var message: String
    var data: requestTeacherModel
}

struct requestTeacherModel : Codable {
    var data : [requestReqTeacherDataModel]
}

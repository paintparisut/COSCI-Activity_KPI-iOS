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

struct ResponseRequestDataModel: Codable {
    var result: String
    var message: String
    var data: requestModel
}

struct requestModel : Codable {
    var data : [requestDataModel]
}


struct requestReqTeacherDataModel : Codable {
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

struct ResponseRequestTeacherDataModel: Codable {
    var result: String
    var message: String
    var data: requestTeacherModel
}

struct requestTeacherModel : Codable {
    var data : [requestReqTeacherDataModel]
}

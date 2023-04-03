//
//  requestModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct requestModel : Encodable {
    let user : userreq?
    let event : eventreq?
    let start_date : String?
    let end_date : String?
    let uploaded_img : String?
    let uploaded_pdf : String?
    let date_request : String?
    let status_request : String?
    let type_request : String?
    let permissions_request : String?
}

struct userreq : Codable {
    let id_user : String?
    let user_id : String?
    let name : String?
    let student_id : String?
}

struct eventreq : Codable {
    let id_event : String?
    let name_event : String?
    let detail_event : String?
    let start_date : Date?
    let end_date : Date?
    let posted_timestamp : String?
    let event_type : String?
    let event_img : String?
    let event_img_list : [String]?
    let activity_hour : Int
    let event_status : Bool?
}

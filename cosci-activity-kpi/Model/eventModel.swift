//
//  eventModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct eventDataModel : Codable {
    let name_event : String?
    let detail_event : String?
    let start_date : String?
    let end_date : String?
    let posted_timestamp : String?
    let event_type : String?
    let event_img : String?
    let event_img_list : [String]?
    let activity_hour : Int?
    let event_status : Bool?
    let permissions_type : String?

}

struct ResponseEventDataModel: Codable {
    let result: String
    let message: String
    var data: eventModel
}

struct eventModel : Codable {
    var data : [eventDataModel]
}

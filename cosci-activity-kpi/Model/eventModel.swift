//
//  eventModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct eventModel : Codable {
    
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

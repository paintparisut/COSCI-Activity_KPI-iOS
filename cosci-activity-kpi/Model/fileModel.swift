//
//  fileModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct fileModel : Codable {
    let file_name: String?
    let filename_extension: String?
    let file_path: String?
    let file_author_id: String?
    let created: String?
}

struct ResponseUploadImage: Codable {
    let result: String
    let message: String
    let data: ImageUrlDataModel
}

struct ImageUrlDataModel: Codable {
    let url: [String]?
}

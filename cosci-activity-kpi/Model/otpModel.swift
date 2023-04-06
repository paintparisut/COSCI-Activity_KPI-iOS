//
//  otpModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation

struct otpModel : Codable {
    
    let email: String?
    let otp: String?
    let expired: String?
    let created: String?
    
}

struct requestOtpModel : Codable {
    var email: String?
    var otp: String?
}

struct requestResendOtpModel : Codable {
    var email: String?
}

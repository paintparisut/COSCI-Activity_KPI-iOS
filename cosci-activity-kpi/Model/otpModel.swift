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
    let email: String? = "parisut.supchokpool@g.swu.ac.th"
    let otp: String? = "033786"
}

struct requestResendOtpModel : Codable {
    let email: String? = "parisut.supchokpool@g.swu.ac.th"
}

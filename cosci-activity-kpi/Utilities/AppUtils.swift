//
//  AppUtils.swift
//  COOK POS
//
//  Created by Parisut Supchokpool on 4/1/2566 BE.
//

import Foundation
import SwiftyRSA
import JWTDecode

struct AppUtils {
    
    static func saveUsrAuthToken(token:String) {
        UserDefaults.standard.setValue(token, forKey: Constants.AppConstants.CUR_USR_TOKEN)
    }
    
}

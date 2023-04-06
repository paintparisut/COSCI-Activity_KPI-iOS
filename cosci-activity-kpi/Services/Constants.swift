//
//  Constants.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation
import UIKit


struct Constants {
    
    static let URL_BASE = "http://localhost:8081"
    
    static let URL_MIDDLEWARE = "/api"
    
    static let URL_ROUTES_ADMIN = "/admin"
    static let URL_ROUTES_AUTH = "/auth"
    static let URL_ROUTES_FILE = "/file"
    static let URL_ROUTES_STUDENT = "/student"
    static let URL_ROUTES_TEACHER = "/teacher"

    
    static let URL_PATH_ADMIN_KPIDASHBOARD = "/kpi-dashboard"
    static let URL_PATH_ADMIN_ACTIVITYDASHBOARD = "/activity-dashboard"
    static let URL_PATH_ADMIN_REQSTUDENTDASHBOARD = "/reqstudent-dashboard"
    static let URL_PATH_ADMIN_REQTEACHERDASHBOARD = "/reqteacher-dashboard"
    static let URL_PATH_ADMIN_POST_ACTIVITY = "/add-activity"
    static let URL_PATH_ADMIN_CRUDSTUDENT = "/crud-student"
    static let URL_PATH_ADMIN_CRUDTEACHER = "/crud-teacher"
    
    static let URL_PATH_AUTH_LOGINSTUDENT = "/login-student"
    static let URL_PATH_AUTH_LOGINTEACHER = "/login-teacher"
    static let URL_PATH_AUTH_GETSTUDENTUPLOADED = "/getstudent-uploaded"
    static let URL_PATH_AUTH_GETTEACHERUPLOADED = "/getteacher-uploaded"
    static let URL_PATH_AUTH_REGISTER_STUDENT = "/student-register"
    static let URL_PATH_AUTH_REGISTER_TEACHER = "/teacher-register"
    static let URL_PATH_AUTH_VERIFY_STUDENT = "/verifystudent"
    static let URL_PATH_AUTH_VERIFY_TEACHER = "/verifyteacher"
    static let URL_PATH_AUTH_RESEND_STUDENT = "/verify/resendstudent"
    static let URL_PATH_AUTH_RESEND_TEACHER = "/verufy/resendteacher"
    static let URL_PATH_AUTH_FORGOTPASSWORD_STUDENT = "/forgotpassword-student"
    static let URL_PATH_AUTH_FORGOTPASSWORD_TEACHER = "/forgotpassword-teacher"

    static let URL_PATH_FILE_UPLOADIMG = "/uploadimg"
    static let URL_PATH_FILE_UPLOADPDF = "/uploadpdf"
    
    static let URL_PATH_STUDENT_REQHISTORY = "/request-history"
    static let URL_PATH_STUDENT_ACTIVITYACTIVE = "/activity-active"
    static let URL_PATH_STUDENT_SINGLEEVENT = "/event/"
    static let URL_PATH_STUDENT_CREATEREQ = "/request"
    static let URL_PATH_STUDENT_CHANGPASSWORD = "/changepassword"

    static let URL_PATH_TEACHER_REQHISTORY = "/request-history"
    static let URL_PATH_TEACHER_KPIACTIVE = "/kpi-active"
    static let URL_PATH_TEACHER_CREATEREQ = "/request"
    static let URL_PATH_TEACHER_SINGLEEVENT = "/event/"
    static let URL_PATH_TEACHER_CHANGPASSWORD = "/changepassword"
    
    struct AppConstants {
        static let CUR_USR_TOKEN = "UserAuthToken"
        static let CUR_USR_ID = "UserDocsID"
        static let CUR_USR_USERID = "UserID"
        static let CUR_USR_ROLE = "UserRole"
    }
    
    struct GraphicColors {
        static let COSCI_BLUEPMR_COLOR = CGColor(red: 35/255, green: 85/255, blue:138/255, alpha: 1)
        static let COSCI_BLUECI_COLOR = CGColor(red: 242/255, green: 130/255, blue: 43/255, alpha: 1)
        static let COSCI_BLUECI1_COLOR = CGColor(red: 242/255, green: 130/255, blue: 43/255, alpha: 1)
        static let COSCI_GRAY_COLOR = CGColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        static let COSCI_ERROR_COLOR = CGColor(red: 250/255, green: 92/255, blue: 92/255, alpha: 1)
        static let COSCI_SUCCESS_COLOR = CGColor(red: 111/255, green: 178/255, blue: 100/255, alpha: 1)
    }
    
    
    struct ConstantFont {
        static let BOLD = "Kanit-Bold"
        static let Medium = "Kanit-Medium"
        static let Regular = "Kanit-Regular"
        static let Thin = "Kanit-Thin"
    }
    

}



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
    
    static let URL_IMG = "/public/img/"
    
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
        
        static let CUR_STU_IMG = "StudentImage"
        static let CUR_STU_NAME = "StudentName"
        static let CUR_STU_USER_ID = "StudentUserID"
        static let CUR_STU_STUDENT_ID = "StudentStudentID"
        static let CUR_STU_TEACHER = "StudentTeacher"
        static let CUR_STU_MAJOR = "StudentMajor"
        static let CUR_STU_EMAIL = "StudentEmail"
        static let CUR_STU_TEL = "StudentTel"

        static let CUR_TEA_IMG = "TeacherImage"
        static let CUR_TEA_NAME = "TeacherName"
        static let CUR_TEA_USER_ID = "TeacheUserID"
        static let CUR_TEA_ROLE = "TeacherRole"
        static let CUR_TEA_EMAIL = "TeacherEmail"
        static let CUR_TEA_TEL = "TeacherTel"

        static let OTP_EMAIL = "OTPEmail"
        
        static let UP_STUDENT_STUDENT_ID = "UploadedStudentID"
        static let UP_STUDENT_NAME = "UploadedStudentName"
        static let UP_STUDENT_MAJOR = "UploadedStudentMajor"
        static let UP_STUDENT_TEACHER = "UploadedStudentTeacher"

        static let UP_TEACHER_USERID = "UploadedTeacherUserID"
        static let UP_TEACHER_NAME = "UploadedTeacherName"
        static let UP_TEACHER_ROLE = "UploadedTeacherRole"
        static let UP_TEACHER_EMAIL = "UploadedTeacherEmail"
        static let UP_TEACHER_TEL = "UploadedTeacherTel"

        static let STUDENT_EVENT_IMG = "EventStudentImg"
        static let STUDENT_EVENT_NAME = "EventStudentName"
        static let STUDENT_EVENT_DETAIL = "EventStudentDetail"
        static let STUDENT_EVENT_TYPE = "EventStudentType"
        static let STUDENT_EVENT_HOUR = "EventStudentHour"
        static let STUDENT_EVENT_START = "EventStudentStart"
        static let STUDENT_EVENT_END = "EventStudentEnd"
        static let STUDENT_EVENT_POSTEDTIMESTAMP = "EventStudentTimeStamp"
        static let STUDENT_EVENT_IMGLIST = "EventStudentImgList"

        static let REQ_EVENT_NAME = "RequestEventName"
        static let REQ_EVENT_IMG = "RequestEventImg"
        static let REQ_EVENT_STUDENT_NAME = "RequestEventStudentName"
        static let REQ_EVENT_TYPE = "RequestEventType"
        static let REQ_EVENT_HOUR = "RequestEventHour"
        static let REQ_EVENT_TIME = "RequestEventTime"
    }
}



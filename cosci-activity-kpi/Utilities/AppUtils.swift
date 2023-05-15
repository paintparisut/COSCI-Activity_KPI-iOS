//
//  AppUtils.swift
//  cosci-activity-kpi
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
    
    
    static func getUsrAuthToken() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_USR_TOKEN) as? String
       }
    
    //decrypt
    static func getId() -> String? {
            return AppUtils.JWT.decryptUsrAuthTokenId()
    }
    
    static func getUserId() -> String? {
        return AppUtils.JWT.decryptUsrAuthTokenUserId()
    }
    
    static func getUserRole() -> String? {
        return AppUtils.JWT.decryptUsrAuthTokenUserRole()
    }
    
    //upload image req
    static func saveImgList(img:[String]) {
        UserDefaults.standard.setValue(img, forKeyPath: Constants.AppConstants.UPLOADED_IMG_REQ)
    }
    static func getImgList() -> [String]? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UPLOADED_IMG_REQ) as? [String]
    }
    static func eraseImgList() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UPLOADED_IMG_REQ)
    }
    
    //Event Student
    static func saveStudentEventID(id:String) {
        UserDefaults.standard.setValue(id, forKeyPath: Constants.AppConstants.STUDENT_EVENT_ID)
    }
    static func saveStudentEventName(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.STUDENT_EVENT_NAME)
    }
    static func saveStudentEventImg(img:String) {
        UserDefaults.standard.setValue(img, forKeyPath: Constants.AppConstants.STUDENT_EVENT_IMG)
    }
    static func saveStudentEventDetail(detail:String) {
        UserDefaults.standard.setValue(detail, forKeyPath: Constants.AppConstants.STUDENT_EVENT_DETAIL)
    }
    static func saveStudentEventType(type:String) {
        UserDefaults.standard.setValue(type, forKeyPath: Constants.AppConstants.STUDENT_EVENT_TYPE)
    }
    static func saveStudentEventHour(hour:Int) {
        UserDefaults.standard.setValue(hour, forKeyPath: Constants.AppConstants.STUDENT_EVENT_HOUR)
    }
    static func saveStudentEventStart(time:String) {
        UserDefaults.standard.setValue(time, forKeyPath: Constants.AppConstants.STUDENT_EVENT_START)
    }
    static func saveStudentEventEnd(time:String) {
        UserDefaults.standard.setValue(time, forKeyPath: Constants.AppConstants.STUDENT_EVENT_END)
    }
    static func saveStudentEventTimeStamp(time:String) {
        UserDefaults.standard.setValue(time, forKeyPath: Constants.AppConstants.STUDENT_EVENT_POSTEDTIMESTAMP)
    }
    static func saveStudentEventImglist(imgList:[String]) {
        UserDefaults.standard.setValue(imgList, forKeyPath: Constants.AppConstants.STUDENT_EVENT_IMGLIST)
    }
    

    static func getStudentEventID() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_ID) as? String
    }
    static func getStudentEventName() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_NAME) as? String
    }
    static func getStudentEventImg() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_IMG) as? String
    }
    static func getStudentEventDetail() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_DETAIL) as? String
    }
    static func getStudentEventType() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_TYPE) as? String
    }
    static func getStudentEventHour() -> Int? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_HOUR) as? Int
    }
    static func getStudentEventStart() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_START) as? String
    }
    static func getStudentEventEnd() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_END) as? String
    }
    static func getStudentEventTimeStamp() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_POSTEDTIMESTAMP) as? String
    }
    static func getStudentEventImgList() -> [String]? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.STUDENT_EVENT_IMGLIST) as? [String]
    }
    
    static func deleteEventStudent() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UPLOADED_IMG_REQ)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_IMG)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_DETAIL)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_TYPE)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_HOUR)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_START)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_END)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_IMGLIST)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.STUDENT_EVENT_POSTEDTIMESTAMP)
    }
    
//    static let REQ_EVENT_NAME = "RequestEventName"
//    static let REQ_EVENT_IMG = "RequestEventImg"
//    static let REQ_EVENT_STUDENT_NAME = "RequestEventStudentName"
//    static let REQ_EVENT_TYPE = "RequestEventType"
//    static let REQ_EVENT_HOUR = "RequestEventHour"
//    static let REQ_EVENT_TIME = "RequestEventTime"
    
    //REQ HISTORY
    static func saveReqEventID(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.REQ_EVENT_ID)
    }
    static func saveReqEventName(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.REQ_EVENT_NAME)
    }
    static func saveReqEventImg(img:String) {
        UserDefaults.standard.setValue(img, forKeyPath: Constants.AppConstants.REQ_EVENT_IMG)
    }
    static func saveReqEventStatusReq(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.REQ_EVENT_STATUSREQ)
    }
    static func saveReqEventType(type:String) {
        UserDefaults.standard.setValue(type, forKeyPath: Constants.AppConstants.REQ_EVENT_TYPE)
    }
    static func saveReqEventHour(hour:String) {
        UserDefaults.standard.setValue(hour, forKeyPath: Constants.AppConstants.REQ_EVENT_HOUR)
    }
    static func saveReqEventTime(time:String) {
        UserDefaults.standard.setValue(time, forKeyPath: Constants.AppConstants.REQ_EVENT_TIME)
    }
    
    static func getReqEventID() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_ID) as? String
    }
    static func getReqEventName() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_NAME) as? String
    }
    static func getReqEventImg() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_IMG) as? String
    }
    static func getReqEventStatusReq() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_STATUSREQ) as? String
    }
    static func getReqEventType() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_TYPE) as? String
    }
    static func getReqEventHour() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_HOUR) as? String
    }
    static func getReqEventTime() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.REQ_EVENT_TIME) as? String
    }

    static func deleteReq() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_IMG)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_STATUSREQ)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_TYPE)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_HOUR)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.REQ_EVENT_TIME)
    }
    
    //OTP
    static func saveEmailOTP(email:String) {
        UserDefaults.standard.setValue(email, forKeyPath: Constants.AppConstants.OTP_EMAIL)
    }
        
    static func getEmailOTP() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.OTP_EMAIL) as? String
       }
    
    static func deleteEmailOTP() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.OTP_EMAIL)
    }
    
    //UPLOADED STUDENT
    static func saveUploadedStudentId(studentid:String) {
        UserDefaults.standard.setValue(studentid, forKeyPath: Constants.AppConstants.UP_STUDENT_STUDENT_ID)
    }
        
    static func saveUploadedStudentName(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.UP_STUDENT_NAME)
    }
    
    static func saveUploadedStudentMajor(major:String) {
        UserDefaults.standard.setValue(major, forKeyPath: Constants.AppConstants.UP_STUDENT_MAJOR)
    }
    static func saveUploadedStudentTeacher(teacher:String) {
        UserDefaults.standard.setValue(teacher, forKeyPath: Constants.AppConstants.UP_STUDENT_TEACHER)
    }
    
    static func getUploadedStudentId() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_STUDENT_STUDENT_ID) as? String
    }
    static func getUploadedStudentName() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_STUDENT_NAME) as? String
    }
    static func getUploadedStudentMajor() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_STUDENT_MAJOR) as? String
    }
    static func getUploadedStudentTeacher() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_STUDENT_TEACHER) as? String
    }
        
    static func deleteUploadedStudent() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_STUDENT_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_STUDENT_STUDENT_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_STUDENT_MAJOR)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_STUDENT_TEACHER)
    }
    
    //UPLOADED TEACHER
    static func saveUploadedTeacherUserID(userid:String) {
        UserDefaults.standard.setValue(userid, forKeyPath: Constants.AppConstants.UP_TEACHER_USERID)
    }
    
    static func saveUploadedTeacherName(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.UP_TEACHER_NAME)
    }
    
    static func saveUploadedTeacherRole(role:String) {
        UserDefaults.standard.setValue(role, forKeyPath: Constants.AppConstants.UP_TEACHER_ROLE)
    }
    
    static func saveUploadedTeacherEmail(email:String) {
        UserDefaults.standard.setValue(email, forKeyPath: Constants.AppConstants.UP_TEACHER_EMAIL)
    }
    
    static func saveUploadedTeacherTel(tel:String) {
        UserDefaults.standard.setValue(tel, forKeyPath: Constants.AppConstants.UP_TEACHER_TEL)
    }
    
    static func getUploadedTeacherId() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_TEACHER_USERID) as? String
    }
    static func getUploadedTeacherName() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_TEACHER_NAME) as? String
    }
    
    static func getUploadedTeacherRole() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_TEACHER_ROLE) as? String
    }
    static func getUploadedTeacherEmail() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_TEACHER_EMAIL) as? String
    }
    static func getUploadedTeacherTel() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.UP_TEACHER_TEL) as? String
    }
    
    static func deleteUploadedTeacher() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_TEACHER_USERID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_TEACHER_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_TEACHER_ROLE)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_TEACHER_EMAIL)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.UP_TEACHER_TEL)
    }
    
    //GET SAVE REMOVE CURRENT​ USER
    
    //SAVE STUDENT
    static func saveStudentID(id:String) {
        UserDefaults.standard.setValue(id, forKeyPath: Constants.AppConstants.CUR_STU_ID)
    }
    static func saveStudentImg(img:String) {
        UserDefaults.standard.setValue(img, forKeyPath: Constants.AppConstants.CUR_STU_IMG)
    }
    static func saveStudentName(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.CUR_STU_NAME)
    }
    static func saveStudentUserID(userID:String) {
        UserDefaults.standard.setValue(userID, forKeyPath: Constants.AppConstants.CUR_STU_USER_ID)
    }
    static func saveStudentStudentID(studentID:String) {
        UserDefaults.standard.setValue(studentID, forKeyPath: Constants.AppConstants.CUR_STU_STUDENT_ID)
    }
    static func saveStudentTeacher(teacher:String) {
        UserDefaults.standard.setValue(teacher, forKeyPath: Constants.AppConstants.CUR_STU_TEACHER)
    }
    static func saveStudentMajor(major:String) {
        UserDefaults.standard.setValue(major, forKeyPath: Constants.AppConstants.CUR_STU_MAJOR)
    }
    static func saveStudentEmail(email:String) {
        UserDefaults.standard.setValue(email, forKeyPath: Constants.AppConstants.CUR_STU_EMAIL)
    }
    static func saveStudentTel(tel:String) {
        UserDefaults.standard.setValue(tel, forKeyPath: Constants.AppConstants.CUR_STU_TEL)
    }
    
    //GET STUDENT
    
    static func getStudentID() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_ID) as? String
       }
    static func getStudentImg() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_IMG) as? String
       }
    
    static func getStudentName() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_NAME) as? String
       }
    
    static func getStudentUserID() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_USER_ID) as? String
       }
    
    static func getStudentStudentID() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_STUDENT_ID) as? String
       }
    
    static func getStudentTeacher() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_TEACHER) as? String
       }
    
    static func getStudentMajor() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_MAJOR) as? String
       }
    
    static func getStudentEmail() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_EMAIL) as? String
       }
    
    static func getStudentTel() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_STU_TEL
           ) as? String
       }
    
    //SAVE TEACHER
    
    static func saveTeacherID(id:String) {
        UserDefaults.standard.setValue(id, forKeyPath: Constants.AppConstants.CUR_TEA_ID)
    }
    static func saveTeacherImg(img:String) {
        UserDefaults.standard.setValue(img, forKeyPath: Constants.AppConstants.CUR_TEA_IMG)
    }
    static func saveTeacherName(name:String) {
        UserDefaults.standard.setValue(name, forKeyPath: Constants.AppConstants.CUR_TEA_NAME)
    }
    
    static func saveTeacherUserID(userID:String) {
        UserDefaults.standard.setValue(userID, forKeyPath: Constants.AppConstants.CUR_TEA_USER_ID)
    }
    
    static func saveTeacherRole(role:String) {
        UserDefaults.standard.setValue(role, forKeyPath: Constants.AppConstants.CUR_TEA_ROLE)
    }
    
    static func saveTeacherEmail(email:String) {
        UserDefaults.standard.setValue(email, forKeyPath: Constants.AppConstants.CUR_TEA_EMAIL)
    }
    
    static func saveTeacherTel(tel:String) {
        UserDefaults.standard.setValue(tel, forKeyPath: Constants.AppConstants.CUR_TEA_TEL)
    }
    
    //GET TEACHER
    
    static func getTeacherId() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_USER_ID
           ) as? String
       }
    static func getTeacherImg() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_IMG
           ) as? String
       }
    
    static func getTeacherName() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_NAME
           ) as? String
       }

    static func getTeacherUserID() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_USER_ID
           ) as? String
       }

    static func getTeacherRole() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_ROLE
           ) as? String
       }

    static func getTeacherEmail() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_EMAIL
           ) as? String
       }

    static func getTeacherTel() -> String? {
           return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_TEA_TEL
           ) as? String
       }

    
    static func eraseAllStudentData() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_USR_TOKEN)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_IMG)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_USER_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_STUDENT_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_TEACHER)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_MAJOR)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_EMAIL)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_STU_TEL)
    }
    
    static func eraseAllTeacherData() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_USR_TOKEN)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_IMG)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_USER_ID)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_ROLE)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_EMAIL)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_TEA_TEL)

    }
    
    struct JWT {
        
        static func decryptUsrAuthTokenId() -> String? {
            
            guard let authtoken = AppUtils.getUsrAuthToken() else {
                return nil
            }
            
            let token = authtoken.components(separatedBy: " ")[1]
            
            do {
                let jwt = try decode(jwt: token)
                let claimid = jwt.claim(name: "id")
                
                if let id = claimid.string {
                    return id
                }
                
            } catch {
                return nil
            }
            return nil
        }
        
        
        static func decryptUsrAuthTokenUserId() -> String? {
            
            guard let authtoken = AppUtils.getUsrAuthToken() else {
                return nil
            }
            
            let token = authtoken.components(separatedBy: " ")[1]
            
            do {
                let jwt = try decode(jwt: token)
                let claimuser = jwt.claim(name: "user_id")
                
                if let user_id = claimuser.string {
                    return user_id
                }
                
            } catch {
                return nil
            }
            return nil
        }
        
        static func decryptUsrAuthTokenUserRole() -> String? {
            
            guard let authtoken = AppUtils.getUsrAuthToken() else {
                return nil
            }
            
            let token = authtoken.components(separatedBy: " ")[1]
            
            do {
                let jwt = try decode(jwt: token)
                let claimrole = jwt.claim(name: "role")

                if let role = claimrole.string {
                    return role
                }
                
            } catch {
                return nil
            }
            return nil
        }
        
    }
}



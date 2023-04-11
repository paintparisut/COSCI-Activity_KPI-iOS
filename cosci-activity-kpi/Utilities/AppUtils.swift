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
    
    //GET SAVE REMOVE CURRENT​ USER
    
    //SAVE STUDENT
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



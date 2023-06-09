//
//  AuthViewModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation
import Alamofire

struct AuthViewModel {
    
    
    public func loginStudent(reqObj: requestLoginStudentModel,then completion: @escaping (Result<dataLoginStudentModel,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_LOGINSTUDENT, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginStudentModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                if data.result == "OK" {
                    let userdata:dataLoginStudentModel = data.data
                    let token = response.response?.allHeaderFields["Authorization"] as? String
                    AppUtils.saveUsrAuthToken(token: token ?? "")
                    
                    completion(.success(userdata))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.result,data: "invalid" )))
                }
                else if data.result == "Wait" {
                    
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.result,data: data.data.email ?? "")))
                    
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    public func loginTeacher(reqObj: requestLoginTeacherModel,then completion: @escaping (Result<dataLoginTeacherModel,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_LOGINTEACHER, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginTeacherModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                if data.result == "OK" {
                    let userdata:dataLoginTeacherModel = data.data
                    let token = response.response?.allHeaderFields["Authorization"] as? String
                    AppUtils.saveUsrAuthToken(token: token ?? "")
                    
                    completion(.success(userdata))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.result,data: "invalid" )))
                }
                else if data.result == "Wait" {
                    
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.result,data: data.data.email ?? "")))
                    
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    public func verifyStudent(reqObj: requestOtpModel,then completion: @escaping (Result<dataLoginStudentModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_VERIFY_STUDENT, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginStudentModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let userdata:dataLoginStudentModel = data.data
                    let token = response.response?.allHeaderFields["Authorization"] as? String
                    AppUtils.saveUsrAuthToken(token: token ?? "")
                    completion(.success(userdata))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message,data: "resend otp")))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    
    public func verifyTeacher(reqObj: requestOtpModel,then completion: @escaping (Result<dataLoginTeacherModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_VERIFY_TEACHER, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginTeacherModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let userdata:dataLoginTeacherModel = data.data
                    let token = response.response?.allHeaderFields["Authorization"] as? String
                    AppUtils.saveUsrAuthToken(token: token ?? "")
                    completion(.success(userdata))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message,data: "resend otp")))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }

    public func resendOTPStudent(reqObj: requestResendOtpModel,then completion: @escaping (Result<dataLoginStudentModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_RESEND_STUDENT, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginStudentModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let userdata:dataLoginStudentModel = data.data
                    completion(.success(userdata))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    
    public func resendOTPTeacher(reqObj: requestResendOtpModel,then completion: @escaping (Result<dataLoginTeacherModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_RESEND_TEACHER, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginTeacherModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let userdata:dataLoginTeacherModel = data.data
                    completion(.success(userdata))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    public func forgotPasswordStudent(reqObj: resquestForgotStudentModel,then completion: @escaping (Result<dataLoginStudentModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_FORGOTPASSWORD_STUDENT, method: .patch, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginStudentModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let userdata:dataLoginStudentModel = data.data
                    completion(.success(userdata))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    public func forgotPasswordTeacher(reqObj: resquestForgotTeacherModel,then completion: @escaping (Result<dataLoginTeacherModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_FORGOTPASSWORD_TEACHER, method: .patch, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseLoginTeacherModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let userdata:dataLoginTeacherModel = data.data
                    completion(.success(userdata))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    public func studentUploaded(reqObj: requestStudentUploadedModel,then completion: @escaping (Result<dataStudentUploadedModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_GETSTUDENTUPLOADED, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseStudentUploadedModel.self) { (response) in
            switch response.result {
            case .success(_):
                print(response)
                guard let data = response.value else {return}
                if data.result == "OK" {
                    let userdata:dataStudentUploadedModel = data.data.data
                    completion(.success(userdata))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }

    public func teacherUploaded(reqObj: requestTeacherUploadedModel,then completion: @escaping (Result<dataTeacherUploadedModel
                                                                                  ,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_GETTEACHERUPLOADED, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
        request.responseDecodable(of: responseTeacherUploadedModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                print("test",data)
                if data.result == "OK" {
                    let userdata:dataTeacherUploadedModel = data.data.data
                    completion(.success(userdata))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
  
    public func registerStudent(reqObj: requestRegisterStudentModel,then completion: @escaping (Result<dataStudentUploadedModel,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_REGISTER_STUDENT, method: .patch, parameters: reqObj, encoder: JSONParameterEncoder.default)
        print(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_REGISTER_STUDENT)
           request.responseDecodable(of: responseStudentUploadRegisModel.self) { (response) in
               switch response.result {
               case .success(_):
                   guard let data = response.value else {return}
                   
                   if data.result == "OK" {
                       let userdata:dataStudentUploadedModel = data.data
                       completion(.success(userdata))
                   }
                   else if data.result == "nOK" {
                       completion(.failure(ServiceError.BackEndError(errorMessage: data.message, data: "")))
                   }
                   else {
                       completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                   }
               case .failure(let error):
                   if let afError = error.asAFError {
                       switch afError {
                       case .sessionTaskFailed(let sessionError):
                           if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                               completion(.failure(ServiceError.NoNetworkError))
                           }
                           else {
                               completion(.failure(ServiceError.UnParsableError))
                           }
                       default :
                           completion(.failure(ServiceError.UnParsableError))
                       }
                   }
                   completion(.failure(ServiceError.UnParsableError))
               }
           }
       }
    
    public func registerTeacher(reqObj: requestRegisterTeacherModel,then completion: @escaping (Result<dataTeacherUploadedModel,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_REGISTER_TEACHER, method: .patch, parameters: reqObj, encoder: JSONParameterEncoder.default)
           request.responseDecodable(of: responseTeacherUploadRegisModel.self) { (response) in
               switch response.result {
               case .success(_):
                   guard let data = response.value else {return}
                   
                   if data.result == "OK" {
                       let userdata:dataTeacherUploadedModel = data.data
                       completion(.success(userdata))
                   }
                   else if data.result == "nOK" {
                       completion(.failure(ServiceError.BackEndError(errorMessage: data.message, data: "")))
                   }
                   else {
                       completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                   }
               case .failure(let error):
                   if let afError = error.asAFError {
                       switch afError {
                       case .sessionTaskFailed(let sessionError):
                           if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                               completion(.failure(ServiceError.NoNetworkError))
                           }
                           else {
                               completion(.failure(ServiceError.UnParsableError))
                           }
                       default :
                           completion(.failure(ServiceError.UnParsableError))
                       }
                   }
                   completion(.failure(ServiceError.UnParsableError))
               }
           }
       }
}

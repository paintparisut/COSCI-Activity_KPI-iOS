//
//  AuthViewModel.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation
import Alamofire

struct AuthViewModel {
    
    public func registerUser(userId:String,then completion: @escaping (Result<teacherUploadedModel,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_PATH_AUTH_GETTEACHERUPLOADED, method: .post, parameters: userId, encoder: JSONParameterEncoder.default)
        print(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_PATH_AUTH_GETTEACHERUPLOADED)
           request.responseDecodable(of: responseteacherUploadedModel.self) { (response) in
               switch response.result {
               case .success(_):
                   guard let data = response.value else {return}
                   
                   if data.result == "OK" {
                       let userdata:teacherUploadedModel = data.data
                       completion(.success(userdata))
                   }
                   else if data.result == "Not found" {
                       completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
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
    
    
    public func loginStudent(reqObj: requestLoginStudentModel,then completion: @escaping (Result<dataLoginStudentModel,ServiceError>) -> ()){
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_AUTH+Constants.URL_PATH_AUTH_LOGINSTUDENT, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default)
            request.responseDecodable(of: respondLoginStudentModel.self) { (response) in
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
                        completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
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

//
//  StudentViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 12/4/2566 BE.
//

import Foundation
import Alamofire

struct StudentViewModel {
    
    public func getEventData(completion: @escaping (Result<eventModel,ServiceError>) -> ()){
           
           let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                       "Content-Type": "application/json"]
           
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_STUDENT+Constants.URL_PATH_STUDENT_ACTIVITYACTIVE, method: .get, headers: headers)

           request.responseDecodable(of: ResponseEventDataModel.self) { (response) in
               switch response.result {
               case .success(_):
                   guard let data = response.value else {return}
                   
                   if data.result == "OK" {
                       let formdata:eventModel = data.data
                       completion(.success(formdata))
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
    
    
    public func getHistoryData(completion: @escaping (Result<requestModel,ServiceError>) -> ()){
           
           let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                       "Content-Type": "application/json"]
           
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_STUDENT+Constants.URL_PATH_STUDENT_REQHISTORY, method: .get, headers: headers)

           request.responseDecodable(of: ResponseRequestDataModel.self) { (response) in
               switch response.result {
               case .success(_):
                   guard let data = response.value else {return}
                   
                   if data.result == "OK" {
                       let formdata:requestModel = data.data
                       completion(.success(formdata))
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
    
    public func changePasswordStudent(reqObj: resquestChangeStudentModel,then completion: @escaping (Result<dataChangeStudentModel
                                                                                  ,ServiceError>) -> ()){
        
        let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                    "Content-Type": "application/json"]
        
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_STUDENT+Constants.URL_PATH_STUDENT_CHANGPASSWORD, method: .patch, parameters: reqObj, encoder: JSONParameterEncoder.default , headers: headers)
        request.responseDecodable(of: responseChangeStudentModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                if data.result == "OK" {
                    let userdata:dataChangeStudentModel = data.data
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
    
}


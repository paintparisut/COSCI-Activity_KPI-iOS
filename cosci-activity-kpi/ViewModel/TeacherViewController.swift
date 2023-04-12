//
//  TeacherViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 12/4/2566 BE.
//

import Foundation
import Alamofire

struct TeacherViewModel {
    
    public func getKpiData(completion: @escaping (Result<eventModel,ServiceError>) -> ()){
           
           let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                       "Content-Type": "application/json"]
           
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_TEACHER+Constants.URL_PATH_TEACHER_KPIACTIVE, method: .get, headers: headers)

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
    
    public func getHistoryData(completion: @escaping (Result<requestTeacherModel,ServiceError>) -> ()){
           
           let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                       "Content-Type": "application/json"]
           
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_TEACHER+Constants.URL_PATH_TEACHER_REQHISTORY, method: .get, headers: headers)

           request.responseDecodable(of: ResponseRequestTeacherDataModel.self) { (response) in
               switch response.result {
               case .success(_):
                   guard let data = response.value else {return}
                   
                   if data.result == "OK" {
                       let formdata:requestTeacherModel = data.data
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
    
    public func changePasswordTeacher(reqObj: resquestChangeTeacherModel,then completion: @escaping (Result<dataLoginTeacherModel
                                                                                  ,ServiceError>) -> ()){
        
        let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                    "Content-Type": "application/json"]
        
        let request = AF.request(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_TEACHER+Constants.URL_PATH_TEACHER_CHANGPASSWORD, method: .patch, parameters: reqObj, encoder: JSONParameterEncoder.default , headers: headers)
        print(Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_TEACHER+Constants.URL_PATH_TEACHER_CHANGPASSWORD)

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
    
    
}

//
//  FileViewController.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 19/4/2566 BE.
//

import Foundation
import Alamofire

struct FileViewModel {
    public func uploadPhoto(with imagesData: [UIImage], completion: @escaping (Result<[String], ServiceError>) -> Void) {
        let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                    "Content-Type": "multipart/form-data"]
        
        let request = AF.upload(multipartFormData: { multipartFormData in
            for (index, image) in imagesData.enumerated() {
                if let imageData = image.jpegData(compressionQuality: 1.0) {
                    multipartFormData.append(imageData, withName: "file", fileName: "image\(index).jpg", mimeType: "image/jpeg")
                }
            }
        },to: Constants.URL_BASE+Constants.URL_MIDDLEWARE+Constants.URL_ROUTES_FILE+Constants.URL_PATH_FILE_UPLOADIMG, method: .post, headers: headers)
        request.responseDecodable(of: ResponseUploadImage.self) { (response) in
            print("RESPONSE",response)
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let imageurl:ResponseUploadImage = data
                    completion(.success(imageurl.data))
                }
                else {
                    completion(.failure(ServiceError.Non200StatusCodeError(APIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                print(error)
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

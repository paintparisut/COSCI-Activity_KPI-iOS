//
//  Error.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 30/3/2566 BE.
//

import Foundation

public enum ServiceError:Error {
    case UnParsableError
    case Non200StatusCodeError(APIError)
    case BackEndError(errorMessage:String,data:String)
    case NoNetworkError
}

public enum MessageError:Error {
    case ConversationNotFound
    case MessageNotFound
}

public struct APIError:Decodable {
    var message:String?
    var status:String?
}

public enum StorageErrors: Error {
    case failedToUpload
    case failedToGetDownloadUrl
}

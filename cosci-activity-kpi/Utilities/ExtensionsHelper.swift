//
//  ExtensionsHelper.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 26/3/2566 BE.
//

import Foundation
import UIKit

//struct Utills {
//
//    static func imgURL(urlimg:String){
//        let url = URL(string: urlimg)
//        let data = try? Data(contentsOf: (url ?? URL(string: ""))!)
//
//        if let imageData = data {
//            let image = UIImage(data: imageData)
//        }
//    }
//}

extension UIImage {
    convenience init?(url: URL?) {
    guard let url = url else { return nil }
            
    do {
        self.init(data: try Data(contentsOf: url))
        
    } catch {
        print("Cannot load image from url: \(url) with error: \(error)")
        return nil
    }
  }
}

struct dateFormat {
    func stringToDate(date:String) -> Date {
        let formatter = DateFormatter()

        // Format 1
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = formatter.date(from: date) {
          return parsedDate
        }

        // Format 2
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        if let parsedDate = formatter.date(from: date) {
          return parsedDate
        }

        // Couldn't parsed with any format. Just get the date
        let splitedDate = date.components(separatedBy: "T")
        if splitedDate.count > 0 {
          formatter.dateFormat = "yyyy-MM-dd"
            if let parsedDate = formatter.date(from: splitedDate[0]) {
            return parsedDate
          }
        }

        // Nothing worked!
        return Date()
    }
}

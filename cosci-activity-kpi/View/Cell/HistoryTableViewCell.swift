//
//  HistoryTableViewCell.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 17/4/2566 BE.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var reqEventNameLB: UILabel!
    @IBOutlet weak var reqEventStatusLB: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setHistoryCell(name:String,type:String,status:String,time:String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = dateFormat().stringToDate(date: time ?? "")
        let dateString = dateFormatter.string(from: date)
        
        reqEventNameLB.text = name
        reqEventStatusLB.text = "สถานะ: \(status)"
    }
    
}

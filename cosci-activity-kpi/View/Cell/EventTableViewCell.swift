//
//  EventTableViewCell.swift
//  cosci-activity-kpi
//
//  Created by Parisut Supchokpool on 16/4/2566 BE.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventNameLB: UILabel!
    @IBOutlet weak var eventDescLB: UILabel!
    @IBOutlet weak var eventTimeLB: UILabel!
    @IBOutlet weak var eventTypeLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setEventcell(imgurl:String,name:String,descript:String,time:String,type:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = dateFormat().stringToDate(date: time ?? "")
        let dateString = dateFormatter.string(from: date)
        
        eventImg.image = UIImage(url: URL(string: Constants.URL_BASE+imgurl ))
        eventNameLB.text = name
        eventDescLB.text = descript
        eventTimeLB.text = dateString
        eventTypeLB.text = type
    }
    
}

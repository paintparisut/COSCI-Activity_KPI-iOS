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
    @IBOutlet weak var eventTimeLB: UILabel!
    @IBOutlet weak var eventTypeLB: UILabel!
    @IBOutlet weak var CardView: UIView!
    @IBOutlet weak var TagCat: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CardInitInterface()
        ImageInitInterface()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func TagColorInterface(catagories:String) -> UIColor {
        if catagories == "หมวดกิจกรรมเลือก" {
            return UIColor(cgColor: ConstantsInterface.GraphicColors.COSCI_ERROR_COLOR)
        } else if catagories == "หมวดกิจกรรมบังคับ" {
            return UIColor(cgColor:ConstantsInterface.GraphicColors.COSCI_BLUECI_COLOR)
        }
        return UIColor.gray
    }

    
    func CardInitInterface() {
        CardView.layer.shadowColor = UIColor.gray.cgColor
        CardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        CardView.layer.shadowOpacity = 0.3
        CardView.layer.masksToBounds = false
        CardView.layer.shadowRadius = 4
    }
    
    func ImageInitInterface() {
        eventImg.layer.cornerRadius = 3.0
    }
    
    
    public func setEventcell(imgurl:String,name:String,time:String,type:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        let date = dateFormat().stringToDate(date: time ?? "")
        let dateString = dateFormatter.string(from: date)
        
        eventImg.image = UIImage(url: URL(string: Constants.URL_BASE+"/"+imgurl ))
        eventNameLB.text = name
        eventTimeLB.text = dateString
        eventTypeLB.text = type
        TagCat.backgroundColor = TagColorInterface(catagories: type)
    }
    
}

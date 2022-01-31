//
//  UserListTableViewCell.swift
//  NikhilShindeAssignment
//
//  Created by Nikhil Shinde on 27/01/22.
//

import UIKit
import MapKit
import SDWebImage
class UserListTableViewCell: UITableViewCell {

    @IBOutlet var mainBGCell: UIView!
    @IBOutlet var userImgView: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblUserGender: UILabel!
    @IBOutlet  var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        UICell()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func UICell(){
        mainBGCell.layer.cornerRadius = 5
        mainBGCell.layer.masksToBounds = true
        mainBGCell.layer.borderWidth = 0.5
        mainBGCell.layer.borderColor = UIColor.systemGray2.cgColor
        mainBGCell.layer.masksToBounds = false
        mainBGCell.layer.shadowOffset = CGSize(width: 1, height: 1)
        mainBGCell.layer.shadowColor = UIColor.black.cgColor
        mainBGCell.layer.shadowOpacity = 2
        mainBGCell.layer.shadowRadius = 1
        lblUserName.textColor = .black
        lblUserGender.textColor = .black
        lblUserName.font = UIFont.systemFont(ofSize: 12)
        lblUserGender.font = UIFont.systemFont(ofSize: 12)
        
    }
    
}

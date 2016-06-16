//
//  BSBRecommendUserCell.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/17.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBRecommendUserCell: UITableViewCell {

    @IBOutlet weak var lineview: UIView!
    @IBOutlet weak var guanzhuButton: UIButton!
   
    @IBOutlet weak var fansLabel: UILabel!
    @IBOutlet weak var usericonimageview: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    var recommenduser : BSBRecommendUser?{
      
        didSet{
            self.lineview.backgroundColor = UIColor(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 0.8)
            let str : String = String(recommenduser!.fans_count)
            self.fansLabel.text = str+"关注你"
            self.usernameLabel.text = recommenduser?.screen_name
            self.usericonimageview.layer.cornerRadius = 19.0
            self.usericonimageview.sd_setImageWithURL(NSURL(string:(recommenduser?.header)!))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableview(tableview:UITableView) -> BSBRecommendUserCell{
        let ID = "RecommendUser"
        let cell : BSBRecommendUserCell = tableview.dequeueReusableCellWithIdentifier(ID) as! BSBRecommendUserCell
        return cell
    }
    
}

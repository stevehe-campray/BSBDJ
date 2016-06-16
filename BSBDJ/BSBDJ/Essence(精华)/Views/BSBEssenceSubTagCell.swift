//
//  BSBEssenceSubTagCell.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/18.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBEssenceSubTagCell: UITableViewCell {
    @IBOutlet weak var imagelistImageview: UIImageView!
    
    @IBOutlet weak var subNumberLabel: UILabel!
    @IBOutlet weak var themeNameLabel: UILabel!
    
    /// 重写frame属性
    override  var frame: CGRect{
        get{
            return super.frame
        }
        set{
            super.frame = CGRect(x: 5, y: newValue.origin.y, width: newValue.size.width-10, height: newValue.size.height - 1)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
    var taginfo : BSBTagInfo?{
        didSet{
            imagelistImageview.sd_setImageWithURL(NSURL(string: (taginfo?.image_list)!))
            themeNameLabel.text = taginfo?.theme_name
            subNumberLabel.text = (taginfo?.sub_number)! + "人订阅"
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
    class func cellWithTableView(tableview:UITableView) ->BSBEssenceSubTagCell{
        
        let essencesubtagID : String = "tagsId"
        let cell : BSBEssenceSubTagCell = tableview.dequeueReusableCellWithIdentifier(essencesubtagID) as! BSBEssenceSubTagCell
        return cell
    }
    

    
}

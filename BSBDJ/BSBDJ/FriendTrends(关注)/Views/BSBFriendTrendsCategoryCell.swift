//
//  BSBFriendTrendsCategoryCell.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/17.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBFriendTrendsCategoryCell: UITableViewCell {
    
    @IBOutlet weak var indeterview: UIView!
    
     var category : BSBCategory?{
//        get{
//            return self.category
//        }
//        set{
//           category = newValue
//        
//        
//        }
        didSet{
             self.textLabel?.text = self.category?.name
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.font = UIFont.systemFontOfSize(15)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let seletcolor  = UIColor(red: 192/255.0, green: 62/255.0, blue: 66/255.0, alpha:1.0)
        self.indeterview.backgroundColor = seletcolor
        self.indeterview.hidden = !selected;
        self.textLabel?.textColor = selected ? seletcolor:(UIColor.darkGrayColor())

    }
    
    
 
    class func cellWithTableView(tableview:UITableView) -> BSBFriendTrendsCategoryCell{
        let ID :String = "category"
        let cell : BSBFriendTrendsCategoryCell = tableview.dequeueReusableCellWithIdentifier(ID) as! BSBFriendTrendsCategoryCell
        return cell;
    }
    
    
}

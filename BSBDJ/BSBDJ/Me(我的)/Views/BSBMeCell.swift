//
//  BSBMeCell.swift
//  BSBDJ
//
//  Created by hejingjin on 16/7/1.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBMeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor = UIColor.blueColor()
        
        let bgView : UIImageView = UIImageView()
        bgView.image = UIImage(named: "mainCellBackground")
        self.backgroundView = bgView;
        
        self.textLabel!.textColor = UIColor.darkGrayColor()
        self.textLabel!.font = UIFont.systemFontOfSize(15)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
//        if self.imageView!.image == nil {
//            return;
//        }
//        
        self.imageView!.xmg_width = 30;
        self.imageView!.xmg_height = self.imageView!.xmg_width
        self.imageView?.xmg_centerY = self.contentView.xmg_height * 0.5;
        
        self.textLabel?.xmg_x = CGRectGetMaxX(self.imageView!.frame) + 10;
        
    }

}

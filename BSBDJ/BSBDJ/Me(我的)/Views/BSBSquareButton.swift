//
//  BSBSquareButton.swift
//  BSBDJ
//
//  Created by hejingjin on 16/7/1.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBSquareButton: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel!.textAlignment = NSTextAlignment.Center;
        
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
       
        self.titleLabel!.font = UIFont.systemFontOfSize(15)
        
        self.setBackgroundImage(UIImage(named:"mainCellBackground"), forState: UIControlState.Normal)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var square : BSBSquare?{
        didSet{
            
            
           self.setTitle(square?.name, forState: UIControlState.Normal)
            // 利用SDWebImage给按钮设置image
            self.sd_setImageWithURL(NSURL(string:(square?.icon)! as String) ,forState: UIControlState.Normal)
            
        }
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // 调整图片
        self.imageView?.xmg_y = self.xmg_height * 0.15;
        self.imageView?.xmg_width = self.xmg_width * 0.5;
        self.imageView?.xmg_height = self.imageView!.xmg_width;
        self.imageView?.xmg_centerX = self.xmg_width * 0.5;
        
        // 调整文字
        self.titleLabel?.xmg_x = 0;
        self.titleLabel?.xmg_y = CGRectGetMaxY(self.imageView!.frame);
        self.titleLabel?.xmg_width = self.xmg_width;
        self.titleLabel!.xmg_height = self.xmg_height - (self.titleLabel?.xmg_y)!;
    }
  
    
}

//
//  BSBVerticalButton.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/31.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBVerticalButton: UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib();
        self.titleLabel?.textAlignment = NSTextAlignment.Center;
    }

    override func layoutSubviews() {
        super.layoutSubviews();
        self.imageView?.xmg_x = 0;
        self.imageView?.xmg_y = 0;
        self.imageView?.xmg_width = self.xmg_width;
        self.imageView?.xmg_height = (self.imageView?.xmg_width)!;
        
        self.titleLabel?.xmg_x = 0;
        self.titleLabel?.xmg_y = (self.imageView?.xmg_height)!;
        self.titleLabel?.xmg_width = self.xmg_width;
        self.titleLabel?.xmg_height = self.xmg_height - (self.imageView?.xmg_height)!;
    }

}

//
//  BSBGudieView.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/1.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBGudieView: UIView {

    class func gudieview() -> BSBGudieView{
        
        return (NSBundle.mainBundle().loadNibNamed("BSBGudieView", owner: nil, options: nil).last)as! BSBGudieView
    }

    @IBAction func close(sender: AnyObject) {
        
        self.removeFromSuperview()
    }
}

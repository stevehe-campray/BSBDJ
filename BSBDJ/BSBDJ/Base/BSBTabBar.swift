//
//  BSBTabBar.swift
//  BSBDJ
//
//  Created by hejingjin on 16/3/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

////////////////////////////////////////////////////////////////////
//                            _ooOoo_                             //
//                           o8888888o                            //
//                           88" . "88                            //
//                           (| ^_^ |)                            //
//                           O\  =  /O                            //
//                        ____/`---'\____                         //
//                      .'  \\|     |//  `.                       //
//                     /  \\|||  :  |||//  \                      //
//                    /  _||||| -:- |||||-  \                     //
//                    |   | \\\  -  /// |   |                     //
//                    | \_|  ''\---/''  |   |                     //
//                    \  .-\__  `-`  ___/-. /                     //
//                  ___`. .'  /--.--\  `. . ___                   //
//                ."" '<  `.___\_<|>_/___.'  >'"".                //
//              | | :  `- \`.;`\ _ /`;.`/ - ` : | |               //
//              \  \ `-.   \_ __\ /__ _/   .-` /  /               //
//        ========`-.____`-.___\_____/___.-`____.-'========       //
//                             `=---='                            //
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^      //
//         佛祖保佑       永无BUG        永不修改                    //
////////////////////////////////////////////////////////////////////


import UIKit
class BSBTabBar: UITabBar {
   
    //成员属性
    var publishbutton:UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
            let publishButton:UIButton = UIButton()
            publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: UIControlState.Normal)
            publishButton.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: UIControlState.Highlighted)
        
            publishbutton = publishButton
            publishbutton!.addTarget(self, action:#selector(BSBTabBar.publishClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(publishButton);
        
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
         // 原来的4个
        let width = self.frame.size.width/5;
        
        publishbutton?.bounds = CGRectMake(0, 0, 49, 49);
        publishbutton?.center = CGPoint(x: self.frame.size.width/2, y:self.frame.size.height/2)
        var i = 0;
        for control in self.subviews{
            if !control.isKindOfClass(UIControl) || control.isKindOfClass(UIButton){
                 continue
            }
            //重新计算
            control.xmg_width = width;
            control.xmg_x =  i > 1 ? width *  CGFloat((i + 1)) : width * CGFloat(i);
            i++
        }
        
    }
    
    func publishClick(btn : UIButton){
        
        self.window?.rootViewController?.presentViewController(BSBPublishViewController(), animated: false, completion: {
            
        });
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

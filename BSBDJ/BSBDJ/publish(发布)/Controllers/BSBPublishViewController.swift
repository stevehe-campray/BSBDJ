//
//  BSBPublishViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBPublishViewController: UIViewController {
    var buttonarray :[UIButton] = []
    
    @IBOutlet weak var cancelButton: UIButton!
    
    var logvimageview : UIImageView?
    
    override func awakeFromNib() {
            super.awakeFromNib()
         self.view.insertSubview(cancelButton, atIndex: 1) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.awakeFromNib();
        
        let titlearray = ["发视频","发图片","发段子","发声音","审帖","发链接"]
        let imagenamearray = ["publish-video","publish-picture","publish-text","publish-audio","publish-review","publish-offline"]
        
   
        
        let screenH :Float = Float(UIScreen.mainScreen().bounds.size.height)
        let screenW :Float = Float(UIScreen.mainScreen().bounds.size.width)
        
        // 中间的6个按钮
        let maxCols = 3;
        let buttonW :Float = 72;
        let buttonH :Float = buttonW + 30;
        let buttonStartY : Float = (screenH - 2 * buttonH) * 0.5
        let buttonStartX : Float = 25.0
        let xMargin : Float = (screenW - 2 * buttonStartX - Float(Int(maxCols)) * buttonW) / Float(Int(maxCols - 1));
//
        for i in 0  ..< 6{
//                        XMGVerticalButton *button = [[XMGVerticalButton alloc] init];
            
            
            let button = BSBVerticalButton();
            
//                         设置内容
                        button.titleLabel!.font = UIFont.systemFontOfSize(14)
                        button.setTitle(titlearray[i], forState: UIControlState.Normal)
                        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                        button.setImage(UIImage(named: imagenamearray[i]), forState: UIControlState.Normal)
                        button.titleLabel?.textAlignment = NSTextAlignment.Center
       
            //            // 设置frame
//                        button.xmg_width = CGFloat(buttonW);
//                        button.xmg_height = CGFloat(buttonH);
//                        let row = i / maxCols;
//                        let col = i % maxCols;
//                        button.xmg_x = CGFloat(buttonStartX + Float(col) * (xMargin + buttonW));
//                        button.xmg_y = CGFloat((buttonStartY + Float(row) * buttonH));
            
                        buttonarray.append(button)
                        self.view.addSubview(button)
            
            
        }
      
        
        self.setbuttonanimation()
        
        
        
        
    }
    
    
    func setbuttonanimation() {
        
        let screenH :Float = Float(UIScreen.mainScreen().bounds.size.height)
        let screenW :Float = Float(UIScreen.mainScreen().bounds.size.width)
        
        // 中间的6个按钮
        let maxCols = 3;
        let buttonW :Float = 72;
        let buttonH :Float = buttonW + 30;
        let buttonStartY : Float = (screenH - 2 * buttonH) * 0.5
        let buttonStartX : Float = 25.0
        let xMargin : Float = (screenW - 2 * buttonStartX - Float(Int(maxCols)) * buttonW) / Float(Int(maxCols - 1));
        
        let  reviewbutton = buttonarray[4];
        let reviewanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let reviewbuttonx = CGFloat(buttonStartX + Float(4%3) * (xMargin + buttonW))
        let reviewbuttony = CGFloat(buttonStartY + Float(4/3) * buttonH - screenH)
        let reviewbuttonendy = CGFloat(buttonStartY + Float(1) * buttonH)
        CGRectMake(reviewbuttonx, reviewbuttony, CGFloat(buttonW), CGFloat(buttonH))
        reviewanima.fromValue = NSValue.init(CGRect: CGRectMake(reviewbuttonx, reviewbuttony, CGFloat(buttonW), CGFloat(buttonH)))
        reviewanima.toValue = NSValue.init(CGRect: CGRectMake(reviewbuttonx, reviewbuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        reviewanima.springSpeed = 10.0;
        reviewanima.springBounciness = 10.0
        reviewanima.beginTime = CACurrentMediaTime() + 0.1
        reviewbutton.pop_addAnimation(reviewanima, forKey: nil)
        
        let  audiobutton = buttonarray[3];
        let audiobuttonanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let audiobuttonx = CGFloat(buttonStartX + Float(3%3) * (xMargin + buttonW))
        let audiobuttony = CGFloat(buttonStartY + Float(3/3) * buttonH - screenH)
        let audiobuttonendy = CGFloat(buttonStartY + Float(1) * buttonH)
        
        audiobuttonanima.fromValue = NSValue.init(CGRect: CGRectMake(audiobuttonx, audiobuttony, CGFloat(buttonW), CGFloat(buttonH)))
        audiobuttonanima.toValue = NSValue.init(CGRect: CGRectMake(audiobuttonx, audiobuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        audiobuttonanima.springSpeed = 10.0;
        audiobuttonanima.springBounciness = 10.0
         audiobuttonanima.beginTime = CACurrentMediaTime() + 0.2
        audiobutton.pop_addAnimation(audiobuttonanima, forKey: nil)
        
        let offlinebutton = buttonarray[5];
        let offlineanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let offlinebuttonx = CGFloat(buttonStartX + Float(5%3) * (xMargin + buttonW))
        let offlinebuttony = CGFloat(buttonStartY + Float(5/3) * buttonH - screenH)
        let offlinebuttonendy = CGFloat(buttonStartY + Float(1) * buttonH)
        offlineanima.fromValue = NSValue.init(CGRect: CGRectMake(offlinebuttonx, offlinebuttony, CGFloat(buttonW), CGFloat(buttonH)))
        offlineanima.toValue = NSValue.init(CGRect: CGRectMake(offlinebuttonx, offlinebuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        offlineanima.springSpeed = 10.0;
        offlineanima.springBounciness = 10.0
        offlineanima.beginTime = CACurrentMediaTime() + 0.3
        offlinebutton.pop_addAnimation(offlineanima, forKey: nil)
        
       
        let picturebutton = buttonarray[1];
        let pictureanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let picturebuttonx = CGFloat(buttonStartX + Float(1%3) * (xMargin + buttonW))
        let picturebuttony = CGFloat(buttonStartY + Float(1/3) * buttonH - screenH)
        let picturebuttonendy = CGFloat(buttonStartY + Float(0) * buttonH)
        pictureanima.fromValue = NSValue.init(CGRect: CGRectMake(picturebuttonx, picturebuttony, CGFloat(buttonW), CGFloat(buttonH)))
        pictureanima.toValue = NSValue.init(CGRect: CGRectMake(picturebuttonx, picturebuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        pictureanima.springSpeed = 10.0;
       pictureanima.springBounciness = 10.0
        pictureanima.beginTime = CACurrentMediaTime() + 0.4
        picturebutton.pop_addAnimation(pictureanima, forKey: nil)
        
        
        let videobutton = buttonarray[0];
        let videoanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let videobuttonx = CGFloat(buttonStartX + Float(0%3) * (xMargin + buttonW))
        let videobuttony = CGFloat(buttonStartY + Float(0/3) * buttonH - screenH)
        let videobuttonendy = CGFloat(buttonStartY + Float(0) * buttonH)
        videoanima.fromValue = NSValue.init(CGRect: CGRectMake(videobuttonx, videobuttony, CGFloat(buttonW), CGFloat(buttonH)))
        videoanima.toValue = NSValue.init(CGRect: CGRectMake(videobuttonx, videobuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        videoanima.springSpeed = 10.0;
       videoanima.springBounciness = 10.0
        videoanima.beginTime = CACurrentMediaTime() + 0.5
        videobutton.pop_addAnimation(videoanima, forKey: nil)
        
        
        let textbutton = buttonarray[2];
        let textbuttonanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let textbuttonx = CGFloat(buttonStartX + Float(2%3) * (xMargin + buttonW))
        let textbuttony = CGFloat(buttonStartY + Float(2/3) * buttonH - screenH)
        let textbuttonendy = CGFloat(buttonStartY + Float(0) * buttonH)
        textbuttonanima.fromValue = NSValue.init(CGRect: CGRectMake(textbuttonx, textbuttony, CGFloat(buttonW), CGFloat(buttonH)))
        textbuttonanima.toValue = NSValue.init(CGRect: CGRectMake(textbuttonx, textbuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        textbuttonanima.springSpeed = 10.0;
       
         textbuttonanima.springBounciness = 10.0
        textbuttonanima.beginTime = CACurrentMediaTime() + 0.6
        textbutton.pop_addAnimation(textbuttonanima, forKey: nil)
        
        
        
        let sloganimageview = UIImageView.init(image: UIImage.init(named: "app_slogan"))
        sloganimageview.xmg_centerY = -60
        sloganimageview.xmg_centerX = (UIScreen.mainScreen().bounds.size.width) * 0.5
        self.logvimageview = sloganimageview
        self.view.addSubview(sloganimageview)
         let sloganimageviewanima = POPSpringAnimation.init(propertyNamed: kPOPLayerPositionY)
    
        sloganimageviewanima.fromValue = CGFloat(screenH * 0.2 - screenH * 1.5)
        sloganimageviewanima.toValue = CGFloat(screenH * 0.2)
        sloganimageviewanima.beginTime = CACurrentMediaTime() + 0.7
        sloganimageviewanima.springBounciness = 10.0
        sloganimageviewanima.springSpeed = 10.0
        sloganimageview.pop_addAnimation(sloganimageviewanima, forKey: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancell() {
        
        let screenH :Float = Float(UIScreen.mainScreen().bounds.size.height)
        let screenW :Float = Float(UIScreen.mainScreen().bounds.size.width)
        
        // 中间的6个按钮
        let maxCols = 3;
        let buttonW :Float = 72;
        let buttonH :Float = buttonW + 30;
        let buttonStartY : Float = (screenH - 2 * buttonH) * 0.5
        let buttonStartX : Float = 25.0
        let xMargin : Float = (screenW - 2 * buttonStartX - Float(Int(maxCols)) * buttonW) / Float(Int(maxCols - 1));
        
        
        let  reviewbutton = buttonarray[4];
        let reviewanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let reviewbuttonx = CGFloat(buttonStartX + Float(4%3) * (xMargin + buttonW))
        let reviewbuttony = CGFloat(buttonStartY + Float(1) * buttonH)
        let reviewbuttonendy = CGFloat(screenH * 1.5)
        CGRectMake(reviewbuttonx, reviewbuttony, CGFloat(buttonW), CGFloat(buttonH))
        reviewanima.fromValue = NSValue.init(CGRect: CGRectMake(reviewbuttonx, reviewbuttony, CGFloat(buttonW), CGFloat(buttonH)))
        reviewanima.toValue = NSValue.init(CGRect: CGRectMake(reviewbuttonx, reviewbuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        reviewanima.springSpeed = 10.0;
        reviewanima.springBounciness = 10.0
        reviewanima.beginTime = CACurrentMediaTime() + 0.1
        reviewbutton.pop_addAnimation(reviewanima, forKey: nil)
        
        
        let  audiobutton = buttonarray[3];
        let audiobuttonanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let audiobuttonx = CGFloat(buttonStartX + Float(3%3) * (xMargin + buttonW))
        let audiobuttony = CGFloat(buttonStartY + Float(1) * buttonH)
        let audiobuttonendy = CGFloat(screenH * 1.5)
        audiobuttonanima.fromValue = NSValue.init(CGRect: CGRectMake(audiobuttonx, audiobuttony, CGFloat(buttonW), CGFloat(buttonH)))
        audiobuttonanima.toValue = NSValue.init(CGRect: CGRectMake(audiobuttonx, audiobuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        audiobuttonanima.springSpeed = 10.0;
        audiobuttonanima.springBounciness = 10.0
        audiobuttonanima.beginTime = CACurrentMediaTime() + 0.2
        audiobutton.pop_addAnimation(audiobuttonanima, forKey: nil)
        
        
        let offlinebutton = buttonarray[5];
        let offlineanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let offlinebuttonx = CGFloat(buttonStartX + Float(5%3) * (xMargin + buttonW))
        let offlinebuttony = CGFloat(buttonStartY + Float(1) * buttonH)
        let offlinebuttonendy = CGFloat(screenH * 1.5)
        offlineanima.fromValue = NSValue.init(CGRect: CGRectMake(offlinebuttonx, offlinebuttony, CGFloat(buttonW), CGFloat(buttonH)))
        offlineanima.toValue = NSValue.init(CGRect: CGRectMake(offlinebuttonx, offlinebuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        offlineanima.springSpeed = 10.0;
        offlineanima.springBounciness = 10.0
        offlineanima.beginTime = CACurrentMediaTime() + 0.3
        offlinebutton.pop_addAnimation(offlineanima, forKey: nil)
        
        
        let picturebutton = buttonarray[1];
        let pictureanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let picturebuttonx = CGFloat(buttonStartX + Float(1%3) * (xMargin + buttonW))
        let picturebuttony = CGFloat(buttonStartY + Float(0) * buttonH)
        let picturebuttonendy = CGFloat(screenH * 1.5)
        pictureanima.fromValue = NSValue.init(CGRect: CGRectMake(picturebuttonx, picturebuttony, CGFloat(buttonW), CGFloat(buttonH)))
        pictureanima.toValue = NSValue.init(CGRect: CGRectMake(picturebuttonx, picturebuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        pictureanima.springSpeed = 10.0;
        pictureanima.springBounciness = 10.0
        pictureanima.beginTime = CACurrentMediaTime() + 0.4
        picturebutton.pop_addAnimation(pictureanima, forKey: nil)
        
        
        let videobutton = buttonarray[0];
        let videoanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let videobuttonx = CGFloat(buttonStartX + Float(0%3) * (xMargin + buttonW))
        let videobuttony = CGFloat(buttonStartY + Float(0) * buttonH)
        let videobuttonendy = CGFloat(screenH * 1.5)
        videoanima.fromValue = NSValue.init(CGRect: CGRectMake(videobuttonx, videobuttony, CGFloat(buttonW), CGFloat(buttonH)))
        videoanima.toValue = NSValue.init(CGRect: CGRectMake(videobuttonx, videobuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        videoanima.springSpeed = 10.0;
        videoanima.springBounciness = 10.0
        videoanima.beginTime = CACurrentMediaTime() + 0.5
        videobutton.pop_addAnimation(videoanima, forKey: nil)
        
        
        let textbutton = buttonarray[2];
        let textbuttonanima = POPSpringAnimation.init(propertyNamed: kPOPViewFrame)
        let textbuttonx = CGFloat(buttonStartX + Float(2%3) * (xMargin + buttonW))
        let textbuttony = CGFloat(buttonStartY + Float(0) * buttonH)
        let textbuttonendy = CGFloat(screenH * 1.5)
        textbuttonanima.fromValue = NSValue.init(CGRect: CGRectMake(textbuttonx, textbuttony, CGFloat(buttonW), CGFloat(buttonH)))
        textbuttonanima.toValue = NSValue.init(CGRect: CGRectMake(textbuttonx, textbuttonendy, CGFloat(buttonW), CGFloat(buttonH)))
        textbuttonanima.springSpeed = 10.0;
        textbuttonanima.springBounciness = 10.0
        textbuttonanima.beginTime = CACurrentMediaTime() + 0.6
        textbutton.pop_addAnimation(textbuttonanima, forKey: nil)
        
        
        
     
        let sloganimageviewanima = POPSpringAnimation.init(propertyNamed: kPOPLayerPositionY)
        sloganimageviewanima.fromValue = CGFloat(screenH * 0.2)
        sloganimageviewanima.toValue = CGFloat(screenH * 1.2)
        sloganimageviewanima.beginTime = CACurrentMediaTime() + 0.65
        sloganimageviewanima.springBounciness = 10.0
        sloganimageviewanima.springSpeed = 10.0
        
        //闭包代替block
        sloganimageviewanima.completionBlock = {(animation, finished) in
            if finished {
               self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    
        self.logvimageview!.pop_addAnimation(sloganimageviewanima, forKey: nil)
        
        
        
        
    }

    

}

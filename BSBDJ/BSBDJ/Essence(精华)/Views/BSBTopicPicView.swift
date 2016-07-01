//
//  BSBTopicPicView.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/3.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBTopicPicView: UIView {

    @IBOutlet weak var contentImageview: UIImageView!
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet weak var gifimageview: UIImageView!
    
    
    @IBOutlet weak var progressview: DALabeledCircularProgressView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoresizingMask = UIViewAutoresizing.None //这个view不被上一个view的改变而伸缩
        self.contentImageview.userInteractionEnabled = true
        
        self.contentImageview.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(BSBTopicPicView.pictureshow)))
//
    }
    
    class func topicpicview() -> BSBTopicPicView{
        return (NSBundle.mainBundle().loadNibNamed("BSBTopicPicView", owner: nil, options: nil).last)as! BSBTopicPicView
    }
  
    
 
   @IBAction  func pictureshow(){
    
//    let showpicvc = BSBShowPictureViewController()
      let showpicvc : BSBShowPictureViewController = BSBShowPictureViewController(nibName: "BSBShowPictureViewController",bundle: nil)
    showpicvc.topicinfo = topic
    
    UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(showpicvc, animated: true, completion: nil)
    
    }
    
   
    
    
    var topic: BSBTopic?{
        didSet{
            contentImageview.sd_setImageWithURL((NSURL(string:(topic?.image0)! as String)), placeholderImage: nil, options: SDWebImageOptions.LowPriority, progress: { (min, max) in
                    self.progressview.hidden = false
                    let progress :CGFloat = CGFloat(Float(min)) * 1.0 / CGFloat(Float(max))
                    self.progressview.setProgress(progress, animated: true)
                    self.progressview.progressLabel.textColor = UIColor.whiteColor()
                    self.progressview.progressLabel.text = String(Int(progress * 100))
            }) { (image, error, cashtype, url) in
                    self.progressview.hidden = true
                
                // cocos2d绘图
              
                UIGraphicsBeginImageContextWithOptions((self.topic?.topicpicimageFrame.size)!,false, 0)
                
                //重绘
                    let width = self.topic!.topicpicimageFrame.size.width;
                    let height = width * image.size.height / image.size.width;
                    image.drawInRect(CGRectMake(0, 0, width, height))
                
                // 获得图片
                    self.contentImageview.image = UIGraphicsGetImageFromCurrentImageContext();
                
                // 结束图形上下文
                    UIGraphicsEndImageContext();
                
                
            }
            

            if (topic?.is_gif)! {
                gifimageview.hidden = false
            }else{
                gifimageview.hidden = true
            }
        }
    }
    

}

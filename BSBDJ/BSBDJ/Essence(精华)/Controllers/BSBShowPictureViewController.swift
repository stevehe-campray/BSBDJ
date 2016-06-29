//
//  BSBShowPictureViewController.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/15.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBShowPictureViewController: UIViewController {

    @IBOutlet weak var backbutton: UIButton!

    
    internal var topicinfo : BSBTopic?
    
    var imageview = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(self.backbutton)
//
        
        // 屏幕尺寸
        
        let screenH = UIScreen.mainScreen().bounds.size.height
        let screenW = UIScreen.mainScreen().bounds.size.width
        
        let imageView = UIImageView.init()
        imageView.userInteractionEnabled = true;
        imageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(BSBShowPictureViewController.back)))
        self.contentScrollView.addSubview(imageView)
      
        
        // 图片尺寸
        let pictureW = screenW;
        let pictureH = pictureW * self.topicinfo!.height / self.topicinfo!.width;
        if (pictureH > screenH) { // 图片显示高度超过一个屏幕, 需要滚动查看
            imageView.frame = CGRectMake(0, 0, pictureW, pictureH);
            self.contentScrollView.contentSize = CGSizeMake(0, pictureH);
        } else {
            imageView.bounds = CGRectMake(0, 0, pictureW, pictureH)
            imageView.xmg_centerY = screenH * 0.5
            imageView.xmg_centerX = screenW * 0.5
        }
        
   
        
         imageView.sd_setImageWithURL((NSURL(string:(topicinfo?.image1)! as String)))
    }

    @IBOutlet weak var contentScrollView: UIScrollView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    @IBAction func back() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveImage(sender: AnyObject) {
        
    }

    @IBAction func forwdimage() {
        
    }
}

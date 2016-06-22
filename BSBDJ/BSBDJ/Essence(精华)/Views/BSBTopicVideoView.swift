//
//  BSBTopicVideoView.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/21.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBTopicVideoView: UIView {

    @IBOutlet weak var contentimageview: UIImageView!

    @IBOutlet weak var backimage: UIImageView!
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var palycountLabel: UILabel!

    @IBOutlet weak var playtimeLabel: UILabel!
    
    
    
    class func topicVideoView() -> BSBTopicVideoView{
        return (NSBundle.mainBundle().loadNibNamed("BSBTopicVideoView", owner: nil, options: nil).last)as! BSBTopicVideoView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoresizingMask = UIViewAutoresizing.None //这个view不被上一个view的改变而伸缩
        //
    }
    
    var topic: BSBTopic?{
        didSet{
            contentimageview.sd_setImageWithURL((NSURL(string:(topic?.image0)! as String)), placeholderImage: nil, options: SDWebImageOptions.LowPriority, progress: { (min, max) in
                
            }) { (image, error, cashtype, url) in
                self.backimage.hidden = true;
            }
            
            let minute = topic!.videotime / 60
            let second = (topic?.videotime)! % 60
            
            let minutestr : String = String(minute)
            let secondstr : String = String(second)
            let voicetimestr : String = minutestr + ":" + secondstr
            
            playtimeLabel.text = voicetimestr
            
            let playcountstr : String  = String(Int((topic?.playcount)!))
            
            palycountLabel.text = playcountstr + "播放"
            
        }
    }
    
}

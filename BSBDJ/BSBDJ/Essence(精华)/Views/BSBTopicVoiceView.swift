//
//  BSBTopicVoiceView.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/21.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBTopicVoiceView: UIView {
    @IBOutlet weak var playtimelabel: UILabel!

    @IBOutlet weak var playbutton: UIButton!
    
    @IBOutlet weak var playtimesLabel: UILabel!
    @IBOutlet weak var contentimageview: UIImageView!
    @IBOutlet weak var indecaterimageview: UIImageView!
    class func topicVoiceView() -> BSBTopicVoiceView{
        return (NSBundle.mainBundle().loadNibNamed("BSBTopicVoiceView", owner: nil, options: nil).last)as! BSBTopicVoiceView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.autoresizingMask = UIViewAutoresizing.None //这个view不被上一个view的改变而伸缩
        //
        self.insertSubview(contentimageview, atIndex: 1)
    }

    var topic: BSBTopic?{
        didSet{
            contentimageview.sd_setImageWithURL((NSURL(string:(topic?.image0)! as String)), placeholderImage: nil, options: SDWebImageOptions.LowPriority, progress: { (min, max) in
            
            }) { (image, error, cashtype, url) in
                self.indecaterimageview.hidden = true;
            }
            let minute = topic!.voicetime / 60
            let second = (topic?.voicetime)! % 60
            let minutestr : String = String(minute)
            let secondstr : String = String(second)
            let voicetimestr : String = minutestr + ":" + secondstr
            
            playtimelabel.text = voicetimestr
            
            let playcountstr : String  = String(Int((topic?.playcount)!))
            playtimesLabel.text = playcountstr + "播放"
            
        }
    }
}

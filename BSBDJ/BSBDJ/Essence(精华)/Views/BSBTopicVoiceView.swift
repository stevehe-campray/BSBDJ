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
    }

    var topic: BSBTopic?{
        didSet{
            contentimageview.sd_setImageWithURL((NSURL(string:(topic?.image0)! as String)), placeholderImage: nil, options: SDWebImageOptions.LowPriority, progress: { (min, max) in
            
            }) { (image, error, cashtype, url) in
                self.indecaterimageview.hidden = true;
            }
        
            playtimelabel.text = topic!.voicetime as String
            playtimesLabel.text = topic!.playcount as String
            
        }
    }
}

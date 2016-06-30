//
//  BSBCommentCell.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/30.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBCommentCell: UITableViewCell {

    @IBOutlet weak var voicepalyButton: UIButton!
    @IBOutlet weak var likeCountLable: UILabel!
    @IBOutlet weak var zanButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var seximageview: UIImageView!
    @IBOutlet weak var usericonimageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commentLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 115
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var comment : BSBComment?{
        didSet{
            self.likeCountLable.text = String(Int((comment?.like_count)!))
            let str = comment?.user?.sex
            if (str!.isEqualToString("m")) {
                self.seximageview.image = UIImage(named: "Profile_manIcon")
            }else{
                self.seximageview.image = UIImage(named: "Profile_womanIcon")
            }
            self.userNameLabel.text = comment?.user?.username as? String
            self.usericonimageview.sd_setImageWithURL(NSURL(string:(comment?.user?.profile_image) as! String), placeholderImage: UIImage(named: "defaultUserIcon"))
             self.commentLabel.text = comment?.content as? String
            self.contentView.layoutIfNeeded()
             var cellheight : CGFloat = 0
          
            if (comment?.voicetime != 0) {
                voicepalyButton.hidden = false
                voicepalyButton.setTitle(String(Int((comment?.voicetime)!)), forState: UIControlState.Normal)
                cellheight = CGRectGetMaxY(self.voicepalyButton.frame)
            }else{
                voicepalyButton.hidden = true
                cellheight = CGRectGetMaxY(self.commentLabel.frame)
            }
            comment?.commentH = cellheight + 10
            
        }
        
    }
}

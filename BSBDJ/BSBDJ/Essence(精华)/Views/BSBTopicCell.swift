//
//  BSBTopicCell.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/2.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBTopicCell: UITableViewCell {



    @IBOutlet weak var cemtentLabels: UILabel!
    @IBOutlet weak var contentview: UIView!
    
    @IBOutlet weak var nameLable: UILabel!

    @IBOutlet weak var creattimeLable: UILabel!
    
    @IBOutlet weak var sinavimageview: UIImageView!
    
    @IBOutlet weak var iconImageview: UIImageView!
    
    @IBOutlet weak var sharebutton: UIButton!
    
    @IBOutlet weak var dingbutton: UIButton!
    
    @IBOutlet weak var caibutton: UIButton!
    
    @IBOutlet weak var commentbutton: UIButton!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    lazy  var topicpicview : BSBTopicPicView  = { () -> BSBTopicPicView in
        
        let temtopicpicview = BSBTopicPicView.topicpicview()
        self.contentView.addSubview(temtopicpicview)
        return temtopicpicview
    }()
    
    lazy  var topicvoiceview : BSBTopicVoiceView  = { () -> BSBTopicVoiceView in
        let temtopicvoiceview = BSBTopicVoiceView.topicVoiceView()
        self.contentView.addSubview(temtopicvoiceview)
        return temtopicvoiceview
    }()
    
    
    lazy  var topicvideoview : BSBTopicVideoView  = { () -> BSBTopicVideoView in
        let topicvideoview = BSBTopicVideoView.topicVideoView()
        self.contentView.addSubview(topicvideoview)
        return topicvideoview
    }()

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 40
        self.cemtentLabels.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 40
        let bgView = UIImageView()
        
        bgView.image = UIImage(named:"mainCellBackground")
        self.backgroundView = bgView;
    }
    
    
   
    /// 重写frame属性
    override  var frame: CGRect{
        
        get{
            return super.frame
        }
        
        set{
            super.frame = CGRect(x: 10, y: newValue.origin.y + 10, width: newValue.size.width-20, height: newValue.size.height - 10)
        }
    }
    
    var topicinfo : BSBTopic?{
        didSet{
        
           iconImageview.sd_setImageWithURL(NSURL(string:(topicinfo?.profile_image) as! String), placeholderImage: UIImage(named: "defaultUserIcon"))
            nameLable.text = topicinfo?.name as? String
//            let datestr : String = 
            let fmt : NSDateFormatter = NSDateFormatter()
            fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let creatdate : NSDate  = fmt.dateFromString((topicinfo?.create_time)! as String)!
            var creatimestr : String = String()
            
            /**
             *  格式化时间 可放入BSBTopic属性的get方法中出来
             *
             *  @return
             */
            if creatdate.isThisYear() {//今年
                
                if creatdate.isToday() {
                    //今天
                    let cmps : NSDateComponents = NSDate().deltaFrom(creatdate)
                    if (cmps.hour>=1){//xx 小时前
                        
                        creatimestr = String(cmps.hour) + " 小时前"
                        creattimeLable.text = creatimestr
                    }else if(cmps.minute>1){//xx分钟前
                        creatimestr = String(cmps.minute) + " 分钟前"
                        creattimeLable.text = creatimestr
                    }else{//刚刚
                        creatimestr = "刚刚"
                        creattimeLable.text = creatimestr
                    }
                }else if creatdate.isYesterday(){//昨天
                     fmt.dateFormat = "昨天 HH:mm"
                     creatimestr = fmt.stringFromDate(creatdate)
                     creattimeLable.text = creatimestr
                }else{ //其他
                     fmt.dateFormat = "MM-dd HH:mm"
                     creatimestr = fmt.stringFromDate(creatdate)
                     creattimeLable.text = creatimestr
                }
                
            }else {//不是今年
                creattimeLable.text = (topicinfo?.create_time as! String)
            }
            
            
            if topicinfo!.sina_v{
                sinavimageview.hidden = false
            }else{
                sinavimageview.hidden = true
            }
            
            /**
             尼玛哦本宝宝不开心  一个NSInteger转String 尼玛要先转成Int  一个Int转CGFloat 要尼玛先
             转FLoat  老子真想伤不起了
             */
            let dingtitle = String(Int((topicinfo?.ding)!))
            let caititle: String = String(Int((topicinfo?.cai)!))
            let sharetitle: String = String(Int((topicinfo?.repost)!))
            let commenttitle: String = String(Int((topicinfo?.comment)!))
            dingbutton.setTitle(dingtitle, forState:UIControlState.Normal)
            caibutton.setTitle(caititle, forState:UIControlState.Normal)
            sharebutton.setTitle(sharetitle, forState:UIControlState.Normal)
            commentbutton.setTitle(commenttitle, forState:UIControlState.Normal)
            
            
            
            contentLabel.text = topicinfo?.text as? String
            
            var cmetentH = CGRectGetHeight(contentview.frame)
            if topicinfo!.top_cmt.count > 0 {
                contentview.hidden = false;
                var contentstr : String = String()
                for cmt in (topicinfo?.top_cmt)! {
                    let user : BSBUser = cmt.user!
                    contentstr = contentstr + (user.username as String)  + " : " + (cmt.content as String) + "\n"
                    
                }
                //移除最后追加的一个换行符
                let endindex : Int = contentstr.characters.count
                let str =    (contentstr as NSString).substringToIndex(endindex - 1)
                cemtentLabels.text = str
                
                self.layoutIfNeeded()
                cmetentH = CGRectGetHeight(cemtentLabels.frame) + 10 + 17
            }else{
                contentview.hidden = true;
                cmetentH = 0
            }
            
            self.layoutIfNeeded()
            var cellheight : CGFloat = CGRectGetMaxY(contentLabel.frame) + 20 + 44
           
            if topicinfo?.type == 10 {
                //配置图片帖子
                topicpicview.hidden = false
                topicvoiceview.hidden = true
                topicvideoview.hidden = true
                let width :CGFloat = UIScreen.mainScreen().bounds.width - 40
                var imageheight :CGFloat = CGFloat(Float((topicinfo?.height)! / (topicinfo?.width)!)) * width
                if imageheight > 1000 {
                    topicpicview.bottomButton.hidden = false
                    imageheight = 300
                }else{
                    topicpicview.bottomButton.hidden = true
                }
                 topicinfo?.topicpicimageFrame = CGRectMake(10, cellheight - 44, width, imageheight)
                topicpicview.topic = topicinfo
                topicpicview.frame = (topicinfo?.topicpicimageFrame)!
                
                
                
                cellheight = cellheight + imageheight + 20
                
                
            }else if(topicinfo?.type == 31){
                //配置声音帖子
                topicvoiceview.hidden = false;
                topicpicview.hidden = true
                topicvideoview.hidden = true
//                topicpicview.frame = (topicinfo?.topicpicimageFrame)!
//                topicvideoview.frame = (topicinfo?.topicvoideimageFrame)!
                let width :CGFloat = UIScreen.mainScreen().bounds.width - 40
                let imageheight :CGFloat = CGFloat(Float((topicinfo?.height)! / (topicinfo?.width)!)) * width
                
                topicinfo?.topicvoiceimageFrame = CGRectMake(10, cellheight - 44, width, imageheight)
                
                topicvoiceview.topic = topicinfo
                topicvoiceview.frame = (topicinfo?.topicvoiceimageFrame)!
                cellheight = cellheight + imageheight + 20
            }else if(topicinfo?.type == 41){
                 topicvideoview.hidden = false
                topicpicview.hidden = true
                topicvoiceview.hidden = true
                let width :CGFloat = UIScreen.mainScreen().bounds.width - 40
                let imageheight :CGFloat = CGFloat(Float((topicinfo?.height)! / (topicinfo?.width)!)) * width
                
                topicinfo?.topicvoideimageFrame = CGRectMake(10, cellheight - 44, width, imageheight)
                
                topicvideoview.topic = topicinfo
                topicvideoview.frame = (topicinfo?.topicvoideimageFrame)!
                cellheight = cellheight + imageheight + 20
                
            }else{
                topicpicview.hidden = true
                topicvoiceview.hidden = true
                topicvideoview.hidden = true
            }
            
            cellheight = cellheight + cmetentH
            topicinfo?.cellHeight = cellheight
        }
    }
    
    
    class func cellWithTableView(tableview:UITableView) ->BSBTopicCell{
        
        let topiccell : String = "topicsId"
        let cell : BSBTopicCell = tableview.dequeueReusableCellWithIdentifier(topiccell) as! BSBTopicCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
}

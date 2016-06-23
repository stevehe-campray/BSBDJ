//
//  BSBTopic.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/2.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//段子

import UIKit

class BSBTopic: NSObject {
    /** 名称 */
    var name : NSString = ""
    /** 头像 */
    var profile_image:NSString = ""
    /** 发帖时间 */
    var create_time:NSString = ""
    /** 文字内容 */
    var text:NSString = ""
    /** 顶的数量 */
    var ding:NSInteger = 0
    /** 踩的数量 */
    var cai:NSInteger = 0
    /** 转发的数量 */
    var repost:NSInteger = 0
    /** 评论的数量 */
    var comment:NSInteger = 0
    /** 是否有加V */
    var sina_v : Bool = false
    
     /** 视频或者图片宽度 */
    var width :CGFloat = 0;
     /** 视频或者图片高度 */
    var height : CGFloat = 0
    //小图
    var image0 : NSString = ""
    //大图
    var image1 : NSString = ""
    //中图
    var image2 : NSString  = ""
    
    //声音时长
    var voicetime : NSInteger = 0
    //播放次数
    var playcount : NSInteger = 0
    
    //声音地址
    var voiceuri : NSString = ""
    //视频地址
    var videouri : NSString = ""
    //视频时长
    var videotime : NSInteger = 0
    
    
    
    
    var type : NSInteger = 1
    
    var is_gif : Bool = false
    
    
    /** 辅助计算cell高度 */
    var cellHeight : CGFloat = 0;
    
    /** 图片的frame*/
    var topicpicimageFrame : CGRect = CGRectMake(0, 0, 0, 0)
    

    var topicvoiceimageFrame : CGRect = CGRectMake(0, 0, 0, 0)
    
    var topicvoideimageFrame : CGRect = CGRectMake(0, 0, 0, 0)
    
    
    var top_cmt : [BSBComment] = []
    
   
    
    
//     private var tagarray : [BSBTagInfo] = []
    //字典数组转模型数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBTopic] {
        var models = [BSBTopic]()
        for dict in list
        {
            models.append(BSBTopic(dict: dict))
        }
        return models
    }
    
    // setValuesForKeysWithDictionary内部会调用以下方法
    override func setValue(value: AnyObject?, forKey key: String) {
        
        // 1.判断当前是否正在给微博字典中的user字典赋值
        if "top_cmt" == key
        {
            // 2.根据user key对应的字典创建一个模型
            top_cmt = BSBComment.dict2Model(value as! [[String : AnyObject]])
            return
        }
        
        // 3,调用父类方法, 按照系统默认处理
        super.setValue(value, forKey: key)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    // 字典转模型
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
   
}

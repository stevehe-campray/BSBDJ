//
//  BSBComment.swift
//  BSBDJ
//
//  Created by hejingjin on 16/6/23.
//  Copyright © 2016年 baisibudejie. All rights reserved.
//

import UIKit

class BSBComment: NSObject {
    
//    /** 音频文件的时长 */
//    @property (nonatomic, assign) NSInteger voicetime;
//    /** 评论的文字内容 */
//    @property (nonatomic, copy) NSString *content;
//    /** 被点赞的数量 */
//    @property (nonatomic, assign) NSInteger like_count;
//    /** 用户 */
//    @property (nonatomic, strong) XMGUser *user;
    
    
    var voicetime : NSInteger = 0;
    
    //评论id
    var id : NSString = ""
    
    //声音来源地址
    var voiceuri : NSString = ""
    
    var content : NSString = ""
    
    var like_count : NSInteger = 0
    
    var commentH : CGFloat = 0//最热评论高度
    
    var user : BSBUser?
    
    //字典数组转模型数组
    class func dict2Model(list: [[String: AnyObject]]) -> [BSBComment] {
        var models = [BSBComment]()
        for dict in list
        {
            models.append(BSBComment(dict: dict))
        }
        return models
    }
    
    // 字典转模型
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
        
    }
    
    
    override func setValue(value: AnyObject?, forKey key: String) {
        // 1.判断当前是否正在给微博字典中的user字典赋值
        if "user" == key
        {
            // 2.根据user key对应的字典创建一个模型
            user = BSBUser(dict: value as! [String : AnyObject])
            return
        }
//         3,调用父类方法, 按照系统默认处理
        super.setValue(value, forKey: key)
    }
    
    //过滤没有的字段
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
}
